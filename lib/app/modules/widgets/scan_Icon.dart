//* ---Scanner Icon Widget on Home Screen-- //

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/QrScanner/qr_scanner.dart';

class ScanIcon extends StatelessWidget {
  ScanIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (() {
          Get.to(QrScannerView());
        }),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(10, 10),
              blurRadius: 40,
            )
          ]),
          child: Image.asset(
            'assets/icons/scanicon.png',
          ),
        ));
  }
}
