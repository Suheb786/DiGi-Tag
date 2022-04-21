import 'package:digitag/app/modules/widgets/custom_appbar.dart';

import 'package:digitag/app/modules/views/drawer_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../../Decoration/text/text.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/audit_toggle_button.dart';
import '../../widgets/profile_Stack.dart';
import 'audit_off_widget.dart';
import 'audit_on_widget.dart';

class ProfileView extends GetView<ProfileController> {
  // ProfileController profileController = Get.find<ProfileController>();

  // HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.profileScrollController.addListener(
      () {
        controller.scrollOffset.value =
            controller.profileScrollController.offset;
      },
    );
    return WillPopScope(
      onWillPop: () => controller.onBack(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,

        // appBar: MyAppBar(
        //   MediaQuery.of(context).size.width,
        //   1,
        //   ctx: context,
        //   // backButton: IconButton(
        //   //   onPressed: () {
        //   //     Get.offAll(
        //   //       DrawerView(
        //   //         screen: Get.find<HomeController>().getPreviousScreen(
        //   //           currentScreen: Screen.profileView,
        //   //         ),
        //   //       ),
        //   //     );
        //   //   },
        //   //   icon: const Icon(Icons.arrow_back),
        //   // ),
        // ),
        // backgroundColor: const Color(0xff50e6da),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                CustomAppBar(
                  deviceWidth: MediaQuery.of(context).size.width,
                  ctx: context,
                ),
              ];
            },
            // body: LayoutBuilder(
            //   builder: (context, constraints) {
            //     return NotificationListener<OverscrollIndicatorNotification>(
            //       onNotification: (overScroll) {
            //         overScroll.disallowIndicator();
            //         return false;
            //       },
            body: SafeArea(
              child: Column(
                children: [
                  // controller.openclosetype.value = "profile";
                  Obx(
                    () => AuditToggleButton(
                      value: controller.status.value,
                      onToggle: (val) {
                        controller.audioSwitchCheck();
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomScrollView(
                      // physics: const ClampingScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Obx(
                            () => controller.status.value
                                ? AuditOnWidget()
                                : AuditOffWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // );
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
