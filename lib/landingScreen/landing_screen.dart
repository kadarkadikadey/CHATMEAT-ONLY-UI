import 'package:chatmeat/common/widgets/costom_button.dart';
import 'package:chatmeat/login_page/screen/login_screen.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  static const routeName = '/landing-screen';
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  void navigateToLoginscreen(BuildContext context){
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                'CHATMEAT',
                style: TextStyle(fontSize: 43, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/EI.png', height: 340, width: size.width),
            ),
            SizedBox(height: size.height / 50),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                ' Privacy Policy ',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: size.width * 0.75,
              child: CostomButton(
                text: 'CONTINUE', 
                onPressed: () => navigateToLoginscreen(context),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
