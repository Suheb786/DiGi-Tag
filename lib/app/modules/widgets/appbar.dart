import 'package:digitag/app/Decoration/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../main.dart';




AppBar MyAppBar(double deviceWidth,int screen) {
  return AppBar(
    toolbarHeight: 60,
    title: Row(
      children: [
        SizedBox(width: deviceWidth / 40),
        customText("Hi, Mohammad", 20),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: (() {}),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                height: 19,
              )),
          SizedBox(width: deviceWidth / 18),
          InkWell(
              onTap: (() {}),
              child: SvgPicture.asset(
                'assets/icons/Bell.svg',
                height: 19,
              )),
          SizedBox(width: deviceWidth / 18),
          InkWell(
              onTap: (() {
                // ZoomDrawer.of(context)!.toggle();
                Get.find<MyDrawerController>().toggleDrawer(screenNum: screen);
                // DrawerView(drawermenu: HomeView());
                print("presseed");
              }),
              child: SvgPicture.asset(
                'assets/icons/tabmenuicon.svg',
                height: 19,
              )),
          SizedBox(width: deviceWidth / 15),
        ],
      )
    ],
    elevation: 0,
    backgroundColor: Color(0xff51E9DD),
    bottomOpacity: 0.0,
    //leading: Custom_UserName_Icons(),
  );
}
