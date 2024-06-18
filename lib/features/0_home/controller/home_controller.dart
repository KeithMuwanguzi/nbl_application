import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<IconData> iconList = [
    FontAwesomeIcons.house, // Home Page
    FontAwesomeIcons.calendarDays, // Game Schedule Page
    FontAwesomeIcons.towerBroadcast, // Live Scores Page
    FontAwesomeIcons.chartLine, // Player Statistics Page
    FontAwesomeIcons.user,
  ];

  final RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}
