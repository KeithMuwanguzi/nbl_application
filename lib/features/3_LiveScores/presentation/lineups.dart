import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineUps extends StatelessWidget {
  const LineUps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Team Lineups',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const LineupRow(
            player1Image: 'assets/images/la.webp',
            player1Name: 'Player 1',
            player1Position: 'Forward',
            player2Image: 'assets/images/la.webp',
            player2Name: 'Player 5',
            player2Position: 'Guard',
          ),
          const SizedBox(height: 10),
          const LineupRow(
            player1Image: 'assets/images/la.webp',
            player1Name: 'Player 2',
            player1Position: 'Guard',
            player2Image: 'assets/images/la.webp',
            player2Name: 'Player 5',
            player2Position: 'Guard',
          ),
          const SizedBox(height: 10),
          const LineupRow(
            player1Image: 'assets/images/la.webp',
            player1Name: 'Player 3',
            player1Position: 'Center',
            player2Image: 'assets/images/la.webp',
            player2Name: 'Player 5',
            player2Position: 'Guard',
          ),
          const SizedBox(height: 10),
          const LineupRow(
            player1Image: 'assets/images/la.webp',
            player1Name: 'Player 4',
            player1Position: 'Forward',
            player2Image: 'assets/images/la.webp',
            player2Name: 'Player 5',
            player2Position: 'Guard',
          ),
          const SizedBox(height: 10),
          const LineupRow(
            player1Image: 'assets/images/la.webp',
            player1Name: 'Player 5',
            player1Position: 'Guard',
            player2Image: 'assets/images/la.webp',
            player2Name: 'Player 5',
            player2Position: 'Guard',
          ),
        ],
      ),
    );
  }
}

class LineupRow extends StatelessWidget {
  final String player1Image;
  final String player1Name;
  final String player1Position;
  final String player2Image;
  final String player2Name;
  final String player2Position;

  const LineupRow({
    super.key,
    required this.player1Image,
    required this.player1Name,
    required this.player1Position,
    required this.player2Image,
    required this.player2Name,
    required this.player2Position,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Adjust the height as needed
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(player1Image),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                player1Name,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                player1Position,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
