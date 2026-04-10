import 'package:chatmeat/home_screen/feature/camera_for_qr_code.dart';
import 'package:chatmeat/home_screen/pages/home_page_part/chat_part.dart';
import 'package:chatmeat/home_screen/pages/home_page_part/group_part.dart';
import 'package:chatmeat/home_screen/pages/home_page_part/store_part.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void navigateTocameraforqrcode(BuildContext context){
    Navigator.pushNamed(context, CameraForQrCode.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'CHATMEAT',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 5,
          bottom: const TabBar(
            indicatorWeight: 4,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'CHAT'),
              Tab(text: 'GROUP'),
              Tab(text: 'STORE'),
            ],
          ),
        ),
        body: TabBarView(children: [ChatPart(), GroupPart(), StorePart()]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigateTocameraforqrcode(context),
          child: Icon(Icons.add_comment),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
