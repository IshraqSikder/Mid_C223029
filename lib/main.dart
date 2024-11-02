import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'effects.dart'; // Import Effects page here

void main() {
  runApp(const RippleEffectApp());
}

class RippleEffectApp extends StatelessWidget {
  const RippleEffectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ripple Effect Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RippleHomePage(title: 'Home Page'),
    );
  }
}

class RippleHomePage extends StatelessWidget {
  const RippleHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    RxBool isRippleExpanded = false.obs;
    RxBool isAnimationCompleted = false.obs;
    var size = Get.size;

    return Obx(() => Scaffold(
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer Circle (only shows when ripple is expanded)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  height: isRippleExpanded.value ? size.height * 0.25 : 0,
                  width: isRippleExpanded.value ? size.width * 0.5 : 0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade500,
                  ),
                  onEnd: () {
                    if (isRippleExpanded.value) {
                      isAnimationCompleted.value = true;
                    }
                  },
                ),

                // Middle Circle (only shows when ripple is expanded)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 555),
                  height: isRippleExpanded.value ? size.height * 0.20 : 0,
                  width: isRippleExpanded.value ? size.width * 0.4 : 0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 60, 66, 69),
                  ),
                ),

                // Inner Circle (clickable, always shown initially)
                GestureDetector(
                  onTap: () {
                    if (isAnimationCompleted.value) {
                      Get.to(() =>
                          const Effects()); // Navigate to Effects page if animation is completed
                    } else {
                      isRippleExpanded.value = !isRippleExpanded.value;
                    }
                    if (!isRippleExpanded.value) {
                      isAnimationCompleted.value = false;
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 555),
                    height: size.height * 0.15,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        isAnimationCompleted.value ? 'Go' : 'Start',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
