import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRScannerView extends StatelessWidget {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [QRScannerView()],
      ),
    );
  }
}
