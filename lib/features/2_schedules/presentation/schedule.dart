import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    const Color highlightColor = Color.fromARGB(255, 116, 9, 9);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'April 2024',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const EventCard(
                date: 'SUN 12',
                eventName: 'Clippers vs Knicks',
                time: '2 - 4 PM',
                highlightColor: highlightColor),
            const EventCard(
                date: 'SUN 12',
                eventName: 'Billy Joel: 2020 Tour',
                time: '7 - 9 PM',
                highlightColor: highlightColor),
            const EventCard(
                date: 'MON 13',
                eventName: 'Lakers vs Knicks',
                time: '7 - 9 PM',
                highlightColor: highlightColor),
            const EventCard(
                date: 'TUE 14',
                eventName: 'Rockets vs Knicks',
                time: '7 - 9 PM',
                highlightColor: highlightColor),
            const EventCard(
                date: 'WED 15',
                eventName: 'Suns vs Knicks',
                time: '2 - 4 PM',
                highlightColor: highlightColor),
            const EventCard(
                date: 'WED 15',
                eventName: 'Justin Bieber Tour',
                time: '7 - 9 PM',
                highlightColor: highlightColor),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date;
  final String eventName;
  final String time;
  final Color highlightColor;

  const EventCard({
    super.key,
    required this.date,
    required this.eventName,
    required this.time,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.split(' ')[0],
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: highlightColor),
              ),
              Text(
                date.split(' ')[1],
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: highlightColor),
              ),
            ],
          ),
          title: Text(
            eventName,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            time,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: highlightColor,
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                var names = eventName.split(' ');
                var name1 = names.contains('vs') ? names[0] : '';
                var name2 = names.contains('vs') ? names[2] : '';
                var logo1 = names.contains('vs') ? 'assets/images/la.webp' : '';
                var logo2 = names.contains('vs') ? 'assets/images/gsw.png' : '';
                return MatchDetailBottomSheet(
                  eventName: eventName,
                  highlightColor: highlightColor,
                  team1Logo: logo1,
                  team2Logo: logo2,
                  team1Name: name1,
                  team2Name: name2,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MatchDetailBottomSheet extends StatelessWidget {
  final String eventName;
  final Color highlightColor;
  String? team1Name;
  String? team2Name;
  String? team1Logo;
  String? team2Logo;

  MatchDetailBottomSheet({
    super.key,
    required this.eventName,
    required this.highlightColor,
    this.team1Name = '',
    this.team2Name = '',
    this.team1Logo = '',
    this.team2Logo = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventName,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: highlightColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  team1Logo != ''
                      ? Image.asset(team1Logo.toString(), height: 50)
                      : Container(), // Replace with team logo
                  const SizedBox(height: 8.0),
                  team1Name != ''
                      ? Text(team1Name.toString(),
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold))
                      : Container(),
                ],
              ),
              team1Logo != ''
                  ? Text('@',
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.bold))
                  : Container(),
              Column(
                children: [
                  team2Logo != ''
                      ? Image.asset(team2Logo.toString(), height: 50)
                      : Container(), // Replace with team logo
                  const SizedBox(height: 8.0),
                  team2Name != ''
                      ? Text(team2Name.toString(),
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold))
                      : Container(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('46 - 18',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Record', style: GoogleFonts.roboto(color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text('7 - 3',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Last 10',
                      style: GoogleFonts.roboto(color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text('L2',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Streak', style: GoogleFonts.roboto(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          GFButton(
            onPressed: () {
              // Handle ticket purchase
            },
            text: 'BUY TICKETS',
            color: highlightColor,
            fullWidthButton: true,
            textStyle: GoogleFonts.roboto(),
          ),
        ],
      ),
    );
  }
}
