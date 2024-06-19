import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 116, 9, 9),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GFAvatar(
                  size: 80,
                  backgroundImage: AssetImage(
                    'assets/images/passport.jpg',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Fan',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Header

                const SizedBox(height: 20),
                // Personal Information
                _buildSectionHeader('Personal Information'),
                _buildPersonalInfo(),

                // Favorites Section (for Fans)
                _buildSectionHeader('Favorite Teams/Players'),
                _buildFavorites(),

                // Recent Activity (optional)
                _buildSectionHeader('Recent Activity'),
                _buildRecentActivity(),

                // Settings
                _buildSectionHeader('Settings'),
                _buildSettings(),

                // Logout Button
                const SizedBox(height: 20),
                GFButton(
                  onPressed: () {
                    // Implement logout functionality
                  },
                  text: 'Logout',
                  icon: const Icon(Icons.logout, color: Colors.white),
                  color: GFColors.DANGER,
                  fullWidthButton: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildPersonalInfo() {
  // Example personal information (this should be dynamic)
  return GFCard(
    content: Column(
      children: [
        _buildInfoItem('Email', 'john.doe@example.com'),
        _buildInfoItem('Phone', '+123 456 7890'),
        _buildInfoItem('Date of Birth', 'Jan 1, 1990'),
      ],
    ),
  );
}

Widget _buildInfoItem(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: GFListTile(
      titleText: title,
      subTitleText: value,
    ),
  );
}

Widget _buildFavorites() {
  // Example favorite items (this should be dynamic)
  return GFCard(
    content: Column(
      children: [
        _buildInfoItem('Team', 'Lakers'),
        _buildInfoItem('Player', 'LeBron James'),
      ],
    ),
  );
}

Widget _buildRecentActivity() {
  // Example recent activities (this should be dynamic)
  return GFCard(
    content: Column(
      children: [
        _buildInfoItem('Watched Game', 'Lakers vs Celtics'),
        _buildInfoItem('Played Game', 'Lakers vs Warriors'),
      ],
    ),
  );
}

Widget _buildSettings() {
  // Example settings (this should be dynamic)
  return GFCard(
    content: Column(
      children: [
        _buildInfoItem('Notifications', 'Enabled'),
        _buildInfoItem('Privacy', 'Public'),
      ],
    ),
  );
}
