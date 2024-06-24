// schedule_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/core/util/widgets/custom_calendar_row.dart';
import 'package:nbl/features/2_schedules/controllers/schedule_controller.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleController controller = Get.put(ScheduleController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Games',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
        child: Column(
          children: [
            Obx(() => CustomCalendarRow(
                  selectedDate: controller.selectedDate.value,
                  onDateSelected: (date) => controller.updateSelectedDate(date),
                )),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.matches.isEmpty) {
                return const Center(
                  child: Text('No matches for this date.'),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.matches.length,
                  itemBuilder: (context, index) {
                    final match = controller.matches[index];
                    return Card(
                      color: Colors.grey[300],
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      elevation: 3.5,
                      // child: ListTile(
                      //   leading: const CircleAvatar(
                      //     backgroundImage: AssetImage(
                      //         'assets/images/la.webp'), // Placeholder for team logo
                      //   ),
                      //   title: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(match.team1),
                      //       Text('${match.score1} - ${match.score2}'),
                      //       Text(match.team2),
                      //     ],
                      //   ),
                      //   subtitle: Text(match.description),
                      //   trailing: Text(match.status),
                      // ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(match.team1Image),
                                  radius: 25,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  match.team1,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  match.record1,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Text(
                              match.score1.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                Text(
                                  match.description.toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "VS",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Text(
                              match.score2.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(match.team2Image),
                                  radius: 25,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  match.team2,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  match.record2,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
