import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../Decoration/text/text.dart';

class CustomAppBar extends StatelessWidget {
  final double deviceWidth;
  final bool? onHomeView;
  final BuildContext ctx;
  const CustomAppBar({
    required this.deviceWidth,
    this.onHomeView = false,
    required this.ctx,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      // pinned: true,
      // snap: true,
      floating: true,
      expandedHeight: 240,
      toolbarHeight: 60,
      // collapsedHeight: 60,
      backgroundColor: Colors.transparent,
      // backgroundColor: const Color(0xff50e6da),
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
                    // DrawerView(drawermenu: HomeView());
                    // print("presseed");
                  }),
                  child: SvgPicture.asset(
                    'assets/icons/tabmenuicon.svg',
                    height: 19,
                  )),
            ),
            Visibility(
              visible: onHomeView!,
              child: SizedBox(
                width: deviceWidth / 15,
              ),
            ),
          ],
        )
      ],
      elevation: 0,
      // flexibleSpace: const ProfileStack(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.only(
            top: 90,
          ),
          child: const ProfileStack(),
        ),
      ),
    );
  }
}
