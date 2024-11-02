import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Effects extends StatelessWidget {
  const Effects({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool menuClicked = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    menuClicked.value = !menuClicked.value;
                  },
                  child: Obx(() => Icon(
                        menuClicked.value ? Icons.close : Icons.menu,
                        size: 30, // Adjust icon size as needed
                      )),
                ),
                SizedBox(height: size.width * .077),
                SizedBox(
                  width: size.width * .80,
                  height: size.height * .69,
                  child: Obx(
                    () => Stack(
                      children: [
                        // black part
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 555),
                          curve: Curves.easeOut,
                          width:
                              menuClicked.value ? size.width : size.width * .39,
                          height: size.height * .80,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                  menuClicked.value ? 55 : 100)),
                        ),
                        // dark grey part
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 555),
                          curve: Curves.easeOut,
                          right: 0,
                          top: menuClicked.value ? 100 : 0,
                          child: Padding(
                            padding: EdgeInsets.all(menuClicked.value ? 17 : 0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 555),
                              curve: Curves.easeOut,
                              width: menuClicked.value
                                  ? size.width - 100 - 34
                                  : size.width * .38,
                              height: menuClicked.value
                                  ? size.height * 0.5
                                  : size.height * .38,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 60, 66, 69),
                                  borderRadius: BorderRadius.circular(
                                      menuClicked.value ? 55 : 100)),
                            ),
                          ),
                        ),
                        // light grey part
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 555),
                          curve: Curves.easeOut,
                          bottom: menuClicked.value
                              ? size.width * 1.1 - size.width * 0.20
                              : 0,
                          right: menuClicked.value ? 17 : 0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 555),
                            curve: Curves.easeOut,
                            width: menuClicked.value
                                ? size.width * 0.12
                                : size.width * .39,
                            height: menuClicked.value
                                ? size.width * 0.12
                                : size.height * .29,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
