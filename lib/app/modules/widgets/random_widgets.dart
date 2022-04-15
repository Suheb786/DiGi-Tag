//?-----------------Imported Packages -------------------------//

import 'package:digitag/app/Decoration/text/text.dart';
import 'package:digitag/app/Decoration/widgets.dart';

import 'package:digitag/app/modules/views/drawer_view.dart';

import 'package:digitag/app/modules/controllers/home_controller.dart';

import 'package:digitag/app/modules/views/profile/profile_view.dart';
import 'package:digitag/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../Decoration/colors/originBg.dart';

//?-----------------Home SCREEN -------------------------//

//* ---Scanner Icon Widget on Home Screen-- //

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

//* ---Profile Stack Widget on Home Screen-- //
class ProfileStack extends StatelessWidget {
  const ProfileStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(DrawerView(
          screen: 1,
        ));

        // Get.offAllNamed(Routes.DRAWER,arguments: 1);
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
//* ---Icon Cirles Stack Widget on Home Screen-- //

class IconStack extends StatelessWidget {
  IconStack({
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
              onTap: () {
                Get.to(Routes.LOGIN);
              },
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
    return InkWell(
      onTap: () {},
      child: Container(
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
      ),
    );
  }
}
//* Flutter Switch Toggle *//

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.status,
  }) : super(key: key);

  final RxBool status;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: status.value,
      padding: 1,
      onToggle: (val) {
        if (status.value == false) {
          status.value = true;
          print("Audit On");
        } else {
          status.value = false;
          print("Audit Off");
        }
      },
      valueFontSize: 9,
      showOnOff: true,
      inactiveText: "Audit Off",
      activeText: "Audit On",
      activeTextColor: Color(0xffBAFFEE),
      inactiveTextColor: Color(0xffBAFFEE),
      width: 75,
      inactiveIcon: Icon(
        Icons.festival,
        color: Colors.white,
      ),
      activeToggleBorder: Border.all(width: 1, color: Color(0x663347B4)),
      height: 27,
      inactiveColor: Color(0x80004E79),
      activeColor: Color(0x80004E79),
      inactiveToggleColor: Color(0x9942FFDD),
      inactiveToggleBorder: Border.all(width: 1, color: Color(0x663347B4)),
    );
  }
}

//* User's Name and Icons in Top Row *//

class Custom_UserName_Icons extends StatelessWidget {
  Custom_UserName_Icons({
    Key? key,
  }) : super(key: key);
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        Container(
          child: customText("Hi, Mohammad", 20),
        ),
        const Spacer(
          flex: 4,
        ),
        InkWell(
            onTap: (() {}),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              height: 19,
            )),
        const Spacer(),
        InkWell(
            onTap: (() {}),
            child: SvgPicture.asset(
              'assets/icons/Bell.svg',
              height: 19,
            )),
        const Spacer(),
        InkWell(
            onTap: (() {
              // controller.openclosetype.value = "home";
              ZoomDrawer.of(context)!.toggle();
              print("presseed");
            }),
            child: SvgPicture.asset(
              'assets/icons/tabmenuicon.svg',
              height: 19,
            )),
        const Spacer()
      ],
    );
  }
}
