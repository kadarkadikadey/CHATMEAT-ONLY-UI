import 'package:chatmeat/home_screen/feature/edit_profile_page.dart';
import 'package:chatmeat/home_screen/feature/imagegridview.dart';
import 'package:chatmeat/home_screen/feature/qr_code.dart';
import 'package:chatmeat/home_screen/feature/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

void navigateToQrcode(BuildContext context){
    Navigator.pushNamed(context, QrCode.routeName);
  }

  void navigateToeditprofilepage(BuildContext context){
    Navigator.pushNamed(context, EditProfilePage.routeName);
  }

  void navigateToSettingPage(BuildContext context){
    Navigator.pushNamed(context, SettingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is wrapped in a SingleChildScrollView to ensure it can scroll on smaller screens
      body: CustomScrollView(
        slivers: [
          // 2. This adapter takes your existing column of widgets and makes it a sliver.
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildProfileInfo(),
                _buildSocialLinks(),
                _buildActionButtons(),
                const Divider(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Imagegridview(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => navigateToQrcode(context),
          child: Icon(Icons.qr_code),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // 1. Header with Banner and Overlapping Profile Picture
  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none, // Allows the CircleAvatar to overlap the Stack boundaries
      alignment: Alignment.bottomLeft,
      children: [
        // Banner Image
        Image.asset(
          'assets/images/EI.png', // Placeholder banner
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Positioned Profile Picture
        const Positioned(
          bottom: -50, // Position half of the avatar below the banner
          left: 20,
          child: CircleAvatar(
            radius: 54, // Outer radius for the border
            backgroundColor: Color(0xFF18181B), // Match the background color
            child: CircleAvatar(
              radius: 50, // Inner radius for the image
              backgroundImage: AssetImage(
                'assets/images/EI.png', // Placeholder profile pic
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 2. User Info Section
  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 65, 20, 10), // Top padding is 65 to clear the avatar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'NAME OF USERS',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'USER ID',
            style: TextStyle(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 16),
          const Text(
            "BIO.................................................................",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // 3. Social Media Links
  Widget _buildSocialLinks() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _SocialIcon(icon: FontAwesomeIcons.instagram, label: 'Instagram!'),
          SizedBox(width: 16),
          _SocialIcon(icon: FontAwesomeIcons.twitch, label: 'Twitter'),
          SizedBox(width: 16),
          _SocialIcon(icon: FontAwesomeIcons.mobile, label: 'Other!'),
        ],
      ),
    );
  }

  // 4. Follow and Subscribe Buttons
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => navigateToeditprofilepage(context),
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  label: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Subscribe Button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => navigateToSettingPage(context),
                  icon: const Icon(Icons.star, color: Colors.white),
                  label: const Text('Setting', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper widget for social icons to avoid repetition
class _SocialIcon extends StatelessWidget {
  // Change IconData to FaIconData
  final FaIconData icon; 
  final String label;

  const _SocialIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // This widget ONLY accepts FaIconData
        FaIcon(icon, color: Colors.purpleAccent, size: 20),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.purpleAccent)),
      ],
    );
  }
}