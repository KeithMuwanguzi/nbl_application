import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbl/features/3_LiveScores/controller/live_controller.dart';

class LiveScore extends StatelessWidget {
  const LiveScore({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveController controller = Get.put(LiveController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title:
            const Text('NBL Live Score', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'NBL CHAMPIONSHIP',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/la.webp',
                            width: 50, height: 50),
                        const SizedBox(height: 8.0),
                        const Text('LA Lakers',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 8.0),
                        const Text('W W L W',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Text(
                      '4th Qtr\n100 : 89',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/gsw.png',
                            width: 50, height: 50),
                        const SizedBox(height: 8.0),
                        const Text('GS Warriors',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 8.0),
                        const Text('L W W W',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  TabBarSection(controller: controller),
                  Expanded(
                    child: TabBarViewSection(controller: controller),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  final LiveController controller;
  const TabBarSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.currentIndex.value,
      length: 4,
      child: Container(
        color: Colors.black,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color.fromARGB(255, 116, 9, 9),
          tabs: const [
            Tab(text: 'Statistics'),
            Tab(text: 'Timeline'),
            Tab(text: 'Lineups'),
            Tab(text: 'Ranking'),
          ],
          onTap: (value) => controller.changeIndex(value),
        ),
      ),
    );
  }
}

class TabBarViewSection extends StatelessWidget {
  final LiveController controller;
  const TabBarViewSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: TabBarView(
        children: [
          Obx(() => controller.tabs[controller.currentIndex.value]),
        ],
      ),
    );
  }
}

class StatisticsTab extends StatelessWidget {
  const StatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        StatisticsRow(title: 'Rebounds', homeValue: '20', awayValue: '18'),
        StatisticsRow(title: 'Assists', homeValue: '6', awayValue: '2'),
        StatisticsRow(title: 'Steals', homeValue: '43', awayValue: '57'),
        StatisticsRow(title: 'Turnovers', homeValue: '13', awayValue: '41'),
        StatisticsRow(
            title: 'Field Goals', homeValue: '13 / 20', awayValue: '6 / 13'),
        StatisticsRow(title: '3 Points', homeValue: '3', awayValue: '4'),
        StatisticsRow(title: 'Free throws', homeValue: '10', awayValue: '8'),
      ],
    );
  }
}

class StatisticsRow extends StatelessWidget {
  final String title;
  final String homeValue;
  final String awayValue;

  const StatisticsRow(
      {super.key,
      required this.title,
      required this.homeValue,
      required this.awayValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(homeValue, style: const TextStyle(fontSize: 16.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              //
            ],
          ),
          Text(awayValue, style: const TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
