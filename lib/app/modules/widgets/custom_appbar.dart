import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/widgets/audit_toggle_button.dart';
import 'package:digitag/app/modules/widgets/medical_Support_Icon.dart';
import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../Decoration/text/text.dart';
import '../../routes/app_pages.dart';
import '../views/medialsupport_view.dart';

class CustomAppBar extends StatelessWidget {
  ProfileController findProfileController = Get.find<ProfileController>();

  final double deviceWidth;
  final bool onHomeView;
  final String title;
  final String titlePrefix;
  final BuildContext ctx;
  final Widget widget;
  double toolbarheight;
  double appbarHeight;
  CustomAppBar({
    required this.deviceWidth,
    required this.title,
    this.titlePrefix = "",
    this.onHomeView = false,
    this.appbarHeight = 250,
    this.toolbarheight = 60,
    required this.ctx,
    Key? key,
    this.widget = const ProfileStack(),
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

          expandedHeight: onHomeView && !findProfileController.status.value
              ? screenHieght * 1
              : appbarHeight,
          toolbarHeight: 60,

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
                //      findController.toggleDrawer(screenNum: screen);
                //       // DrawerView(drawermenu: HomeView());
                //       print("presseed");
                //     }),
                //     child: SvgPicture.asset(
                //       'assets/icons/tabmenuicon.svg',
                //       height: 19,
                //     )):Size  // MedialsupportController controller = Get.put(MedialsupportController());dBox.shrink(),

                Visibility(
                  visible: onHomeView,
                  child: InkWell(
                      onTap: (() {
                        // ZoomDrawer.of(context)!.toggle();
                        // findController
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
                if (onHomeView && !findProfileController.status.value) {
                  return FittedBox(
                    child: Column(
                      children: [
                        SizedBox(height: screenHieght * 0.05),
                        MedicalSupportIcon(
                          ontap: () {
                            Get.toNamed(Routes.MEDIALSUPPORT);
                          },
                        ),
                        SizedBox(height: screenHieght * 0.08),
                        widget,
                        SizedBox(height: screenHieght * 0.04),
                        Visibility(
                          visible: !findProfileController.status.value,
                          child: AuditToggleButton(
                            value: findProfileController.status.value,
                            onToggle: (val) {
                              findProfileController.audioSwitchCheck();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (findProfileController.status.value) {
                  return ProfileStack();
                } else {
                  return Column(
                    children: [
                      SizedBox(height: screenHieght * 0.05),
                      widget,
                    ],
                  );
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
