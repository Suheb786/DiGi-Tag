import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrStack extends StatelessWidget {
  final String uid;
  const QrStack({
    required this.uid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          OverflowBox(
            maxHeight: 350,
            maxWidth: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x0dFFFFFF),
                  // gradient: LinearGradient(
                  //   colors: [Color(0x1AFFFFFF), Color(0x1Ac4c4c4)],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  //   // stops: [0.05, 0.74, 1.2],
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromRGBO(64, 61, 255, 0.2),
                  //     offset: Offset(0, 4),
                  //     spreadRadius: 20,
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          OverflowBox(
            maxHeight: 320,
            maxWidth: 320,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x1AFFFFFF),
                  // gradient: LinearGradient(
                  //   colors: [Color(0x1AFFFFFF), Color(0x1Ac4c4c4)],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  //   // stops: [0.05, 0.74, 1.2],
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromRGBO(64, 61, 255, 0.2),
                  //     offset: Offset(0, 4),
                  //     spreadRadius: 20,
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          OverflowBox(
            maxHeight: 290,
            maxWidth: 290,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x26FFFFFF),
                  // gradient: LinearGradient(
                  //   colors: [Color(0x1AFFFFFF), Color(0x1Ac4c4c4)],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  //   // stops: [0.05, 0.74, 1.2],
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromRGBO(64, 61, 255, 0.2),
                  //     offset: Offset(0, 4),
                  //     spreadRadius: 20,
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          OverflowBox(
            maxHeight: 260,
            maxWidth: 260,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x99FFFFFF),
                      Color(0x8cFFFFFF),
                      Color(0x66c4c4c4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    // stops: [0.05, 0.74, 1.2],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(64, 61, 255, 0.2),
                      offset: Offset(0, 4),
                      spreadRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          QrImage(
            data: uid,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
