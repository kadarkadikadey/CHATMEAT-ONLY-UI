import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget{
  static const routeName = '/edit-profile-page';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('edit profile page'),);
  }
}