import 'package:flutter/material.dart';

class CameraForQrCode extends StatefulWidget {
  static const routeName = '/Camera-for-qr-code';
  const CameraForQrCode({super.key});

  @override
  State<CameraForQrCode> createState() => _CameraForQrCodeState();
}

class _CameraForQrCodeState extends State<CameraForQrCode> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('open camera'));
  }
}
