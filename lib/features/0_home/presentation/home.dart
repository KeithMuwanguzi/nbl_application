import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/features/0_home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: Obx(() => controller.pages[controller.currentPage.value]),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          backgroundColor: const Color.fromARGB(255, 116, 9, 9),
          height: 65,
          itemCount: controller.iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  controller.iconList[index],
                  size: 24,
                  color: isActive ? Colors.amber : Colors.white,
                ),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      controller.texts[index].toString(),
                      style: GoogleFonts.roboto(
                        color: isActive ? Colors.amber : Colors.white,
                      ),
                    ))
              ],
            );
          },
          activeIndex: controller.currentPage.value,
          onTap: (value) => controller.changePage(value),
          gapWidth: 10,
          shadow: const BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ),
      ),
    );
  }
}
