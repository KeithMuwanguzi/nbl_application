import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbl/features/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.currentPage.value.toString())),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          itemCount: controller.iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Icon(
              controller.iconList[index],
              size: 24,
              color: isActive ? Colors.white : Colors.amber,
            );
          },
          activeIndex: controller.currentPage.value,
          onTap: (value) => controller.changePage(value),
        ),
      ),
    );
  }
}
