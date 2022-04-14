import 'package:digitag/app/Decoration/text/text.dart';
import 'package:digitag/app/modules/views/drawer_view.dart';
import 'package:digitag/app/modules/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

AppBar MyAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 60,
    title: Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width / 40),
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
          SizedBox(width: MediaQuery.of(context).size.width / 18),
          InkWell(
              onTap: (() {}),
              child: SvgPicture.asset(
                'assets/icons/Bell.svg',
                height: 19,
              )),
          SizedBox(width: MediaQuery.of(context).size.width / 18),
          InkWell(
              onTap: (() {
                ZoomDrawer.of(context)!.toggle();
                // DrawerView(drawermenu: HomeView());
                print("presseed");
              }),
              child: SvgPicture.asset(
                'assets/icons/tabmenuicon.svg',
                height: 19,
              )),
          SizedBox(width: MediaQuery.of(context).size.width / 15),
        ],
      )
    ],
    elevation: 0,
    backgroundColor: Color(0xff51E9DD),
    bottomOpacity: 0.0,
    //leading: Custom_UserName_Icons(),
  );
}
