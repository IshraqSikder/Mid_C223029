import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mid Exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    RxBool rippleClicked = false.obs;
    var size = Get.size;

    return Obx(() => Scaffold(
            body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1st circle
              AnimatedContainer(
                duration: const Duration(milliseconds: 555),
                height: rippleClicked.value
                    ? size.height * 0.15
                    : size.height * 0.25,
                width:
                    rippleClicked.value ? size.width * 0.40 : size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade500,
                ),
              ),
              // 2nd circle
              AnimatedContainer(
                duration: const Duration(milliseconds: 555),
                height: rippleClicked.value
                    ? size.height * 0.15
                    : size.height * 0.20,
                width:
                    rippleClicked.value ? size.width * 0.40 : size.width * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey.shade500,
                ),
              ),
              // 3rd circle
              AnimatedContainer(
                duration: const Duration(milliseconds: 555),
                height: rippleClicked.value
                    ? size.height * 0.15
                    : size.height * 0.15,
                width:
                    rippleClicked.value ? size.width * 0.40 : size.width * 0.3,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )));
  }
}