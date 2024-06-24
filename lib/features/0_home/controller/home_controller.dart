import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbl/features/2_schedules/presentation/schedule.dart';
import 'package:nbl/features/3_LiveScores/presentation/live.dart';
import 'package:nbl/features/4_Player_TeamStats/presentation/stats.dart';
import 'package:nbl/features/5_news/presentation/news.dart';
import 'package:nbl/features/profile/presentation/profile.dart';

class HomeController extends GetxController {
  List<IconData> iconList = [
    Icons.home,
    Icons.calendar_month, // Home Page
    // FontAwesomeIcons.calendarDays, // Game Schedule Page
    Icons.live_tv, // Live Scores Page
    Icons.grade, // Player Statistics Page
    Icons.verified_user,
  ];

  List texts = ['For you', 'Games', 'Live', 'Stats', 'User'];

  var pages = [
    const News(),
    const Schedule(),
    const LiveScore(),
    const Stats(),
    const Profile(),
  ];

  final RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}
