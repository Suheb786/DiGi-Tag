//* ---Profile Stack Widget on Home Screen-- //
import 'package:digitag/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileStack extends StatelessWidget {
  const ProfileStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.offAll(DrawerView(
        //   screen: Screen.profileView,
        // ));

        // Get.offAllNamed(Routes.DRAWER,arguments: 1);

        Get.toNamed(Routes.PROFILE);
      },
      child: Stack(
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
      ),
    );
  }
}
