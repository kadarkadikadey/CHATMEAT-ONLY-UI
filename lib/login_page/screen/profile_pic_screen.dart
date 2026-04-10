import 'package:chatmeat/login_page/screen/banner_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatmeat/common/widgets/costom_button.dart';

class ProfilePicScreen extends StatefulWidget {
  static const routeName = '/profilepic-screen';
  const ProfilePicScreen({super.key});

  @override
  State<ProfilePicScreen> createState() => _ProfilePicScreenState();
}

class _ProfilePicScreenState extends State<ProfilePicScreen> {
  void navigateToBannerScreen(BuildContext context){
    Navigator.pushNamed(context, BannerScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Please Select A Profile Picture',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/EI.png'),
                radius: 150,
              ),
            ),
            const Spacer(),
            CostomButton(text: 'Select Picture', onPressed: () {}),
            const SizedBox(height: 15),
            CostomButton(text: 'Next', onPressed: () => navigateToBannerScreen(context)),
            const SizedBox(height: 15),
            CostomButton(text: 'Skip', onPressed: () => navigateToBannerScreen(context)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
