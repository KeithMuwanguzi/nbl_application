// schedule_controller.dart
import 'package:get/get.dart';
import 'match_data.dart';

class ScheduleController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var matches = <Match>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMatchesForDate(selectedDate.value);
  }

  void fetchMatchesForDate(DateTime date) {
    matches.value = dummyMatches
        .where((match) => match.date == date.toIso8601String().substring(0, 10))
        .toList();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    fetchMatchesForDate(date);
  }
}
