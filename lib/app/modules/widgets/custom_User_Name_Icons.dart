//* User's Name and Icons in Top Row *//

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../Decoration/text/text.dart';
import '../controllers/home_controller.dart';

class CustomUserNameIcons extends StatelessWidget {
  CustomUserNameIcons({
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
