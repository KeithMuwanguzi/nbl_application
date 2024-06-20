import 'package:get/get.dart';
import 'package:nbl/features/3_LiveScores/presentation/lineups.dart';
import 'package:nbl/features/3_LiveScores/presentation/live.dart';
import 'package:nbl/features/3_LiveScores/presentation/ranking.dart';
import 'package:nbl/features/3_LiveScores/presentation/timeline.dart';

class LiveController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  var tabs = [
    const StatisticsTab(),
    const TimeLine(),
    const LineUps(),
    const Ranking(),
  ];
}
