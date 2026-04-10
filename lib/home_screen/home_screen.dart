import 'package:chatmeat/home_screen/pages/home_page.dart';
import 'package:chatmeat/home_screen/pages/profile_page.dart';
import 'package:chatmeat/home_screen/pages/store_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationtTapped(int page) {
    pageController.jumpToPage(page);
  }


  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          HomePage(),
          StorePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _page == 0 ? Colors.deepPurple : Colors.black12,), 
            label: '',
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_business, color: _page == 1 ? Colors.deepPurple : Colors.black12,), 
          label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded, color: _page == 2 ? Colors.deepPurple : Colors.black12,),
            label: '',
          ),
        ],
        onTap: navigationtTapped,
      ),
    );
  }
}
