import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/widgets/audit_toggle_button.dart';
import 'package:digitag/app/modules/widgets/medical_Support_Icon.dart';
import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../Decoration/text/text.dart';

class CustomAppBar extends StatelessWidget {
  final double deviceWidth;
  final bool onHomeView;
  final String title;
  final String titlePrefix;
  final BuildContext ctx;
  const CustomAppBar({
    required this.deviceWidth,
    required this.title,
    this.titlePrefix = "",
    this.onHomeView = false,
    required this.ctx,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHieght = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      // initState: (_) {},
      builder: (_) {
        return SliverAppBar(
          stretch: true,
          // pinned: true,
          // snap: true,
          floating: true,
          expandedHeight:
              onHomeView && !Get.find<ProfileController>().status.value
                  ? screenHieght * 1
                  : 240,
          toolbarHeight: 60,
          // collapsedHeight: 60,
          backgroundColor: Colors.transparent,
          // backgroundColor: const Color(0xff50e6da),
          title: FittedBox(
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width / 40),
                customText(
                  titlePrefix.isNotEmpty ? titlePrefix + " " + title : title,
                  20,
                ),
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
                  visible: onHomeView,
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
                  visible: onHomeView,
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
            // stretchModes: [StretchMode.blurBackground],
            collapseMode: CollapseMode.parallax,

            background: Padding(
              padding: const EdgeInsets.only(
                top: 90,
              ),
              child: Obx(() {
                if (onHomeView && !Get.find<ProfileController>().status.value) {
                  return FittedBox(
                    child: Column(
                      children: [
                        SizedBox(height: screenHieght * 0.05),
                        MedicalSupportIcon(),
                        SizedBox(height: screenHieght * 0.08),
                        ProfileStack(),
                        SizedBox(height: screenHieght * 0.04),
                        Visibility(
                          visible: !Get.find<ProfileController>().status.value,
                          child: AuditToggleButton(
                            value: Get.find<ProfileController>().status.value,
                            onToggle: (val) {
                              Get.find<ProfileController>().audioSwitchCheck();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (Get.find<ProfileController>().status.value) {
                  return ProfileStack();
                } else {
                  return ProfileStack();
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
