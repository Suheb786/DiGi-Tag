import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors/originBg.dart';

//* ---Scanner Icon Widget on Home Screen-- //
class ScanIcon extends StatelessWidget {
  const ScanIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

//* ---Profile Stack Widget on Home Screen-- //
class ProfileStack extends StatelessWidget {
  const ProfileStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Container(
            height: 164,
            width: 164,
            color: Color(0x1Affffff),
          ),
        ),
        ClipOval(
          child: Container(
            height: 146,
            width: 146,
            color: Color(0x33ffffff),
          ),
        ),
        ClipOval(
          child: Container(
            height: 124,
            width: 124,
            color: Color(0x40ffffff),
          ),
        ),
        ClipOval(
          child: Container(
            child: Image.asset(
              'assets/images/demopic.png',
            ),
            height: 104,
            width: 104,
            decoration: const BoxDecoration(
              color: Color(0x4Dffffff),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//* ---Icon Cirles Stack Widget on Home Screen-- //

class IconStack extends StatelessWidget {
  const IconStack({
    Key? key,
  }) : super(key: key);

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
              onTap: () {},
              child: const OverflowBox(
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

//* ---Medical Support Icons Widget -- //

class MedicalSupportIcon extends StatelessWidget {
  const MedicalSupportIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Color(0x26ffffff)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/icons/MedicalSupport.svg',
        ),
      ),
    );
  }
}
