//* ---Icon Cirles Stack Widget on Home Screen-- //

import 'package:digitag/app/modules/widgets/random_widgets.dart';
import 'package:digitag/app/modules/widgets/scan_Icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class IconStack extends StatelessWidget {
  IconStack({
    Key? key,
  }) : super(key: key);
  final qrKey = GlobalKey(debugLabel: "QR");
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            OverflowBox(
              maxWidth: 536,
              maxHeight: 536,
              child: ClipOval(
                child: Container(
                  color: Color(0x0Dffffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 312,
              maxWidth: 312,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 244,
              maxWidth: 244,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 155,
              maxWidth: 155,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(Routes.LOGIN);
              },
              child: OverflowBox(
                maxWidth: 78,
                maxHeight: 78,
                child: ScanIcon(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
