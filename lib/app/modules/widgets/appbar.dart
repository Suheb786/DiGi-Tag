import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../Decoration/text/text.dart';

AppBar myAppBar(
  double deviceWidth, {
  required final String userName,
  bool? onHomeView = false,
  required BuildContext ctx,
}) {
  return AppBar(
    toolbarHeight: 60,
    title: FittedBox(
      child: Row(
        children: [
          SizedBox(width: deviceWidth / 40),
          customText(userName, 20),
        ],
      ),
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
          // onHomeView?InkWell(
          //     onTap: (() {
          //       // ZoomDrawer.of(context)!.toggle();
          //       Get.find<MyDrawerController>().toggleDrawer(screenNum: screen);
          //       // DrawerView(drawermenu: HomeView());
          //       print("presseed");
          //     }),
          //     child: SvgPicture.asset(
          //       'assets/icons/tabmenuicon.svg',
          //       height: 19,
          //     )):SizedBox.shrink(),

          Visibility(
            visible: onHomeView!,
            child: InkWell(
                onTap: (() {
                  // ZoomDrawer.of(context)!.toggle();
                  // Get.find<MyDrawerController>()
                  //     .toggleDrawer(screenNum: screen);
                  ZoomDrawer.of(ctx)!.toggle();
                  print("object");
                  // DrawerView(drawermenu: HomeView());
                  print("presseed");
                }),
                child: SvgPicture.asset(
                  'assets/icons/tabmenuicon.svg',
                  height: 19,
                )),
          ),
          Visibility(
              visible: onHomeView, child: SizedBox(width: deviceWidth / 15)),
        ],
      )
    ],
    elevation: 0,
    backgroundColor: Colors.transparent,
    bottomOpacity: 0.0,
    //leading: Custom_UserName_Icons(),
  );
}
