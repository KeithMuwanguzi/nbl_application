// match_data.dart
class Match {
  final String team1;
  final String team2;
  final int score1;
  final int score2;
  final String status;
  final String date;
  final String record1;
  final String record2;
  final String team1Image;
  final String team2Image;
  final String description;

  Match({
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.status,
    required this.date,
    required this.record1,
    required this.record2,
    required this.team1Image,
    required this.team2Image,
    required this.description,
  });
}

List<Match> dummyMatches = [
  Match(
    team1: 'City Oilers',
    team2: 'Ndejje BC',
    score1: 88,
    score2: 106,
    status: 'Final',
    date: '2024-06-18',
    record1: '13-10',
    record2: '12-09',
    description: 'NBL Rd One',
    team1Image: "assets/images/oilers.jpg",
    team2Image: 'assets/images/ndejje.jpg',
  ),
  Match(
    team1: 'Nam Blazers',
    team2: 'LStone BC',
    score1: 80,
    score2: 116,
    status: 'Final',
    date: '2024-06-18',
    record1: '9-13',
    record2: '19-07',
    description: 'NBL Rd One',
    team1Image: "assets/images/namBalzers.jpg",
    team2Image: "assets/images/stone.jpg",
  ),
];
