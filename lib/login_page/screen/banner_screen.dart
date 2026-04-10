import 'package:chatmeat/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatmeat/common/widgets/costom_button.dart';

class BannerScreen extends StatefulWidget {
  static const routeName = '/banner-screen';
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _ProfilePicScreenState();
}

class _ProfilePicScreenState extends State<BannerScreen> {
  void navigateToHomeScreen(BuildContext context){
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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
              'Please Select A Banner Picture',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/EI.png', height: 340,),
            ),
            const Spacer(),
            CostomButton(text: 'Select Banner', onPressed: () {}),
            const SizedBox(height: 15),
            CostomButton(text: 'Skip', onPressed: () => navigateToHomeScreen(context)),
            const SizedBox(height: 15),
            CostomButton(text: 'Next', onPressed: () => navigateToHomeScreen(context)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
