import 'package:flutter/material.dart';

class QrCode extends StatefulWidget{
  static const routeName = '/qr-code';
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('QR Code'),
    );
}
}