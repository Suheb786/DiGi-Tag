
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:digitag/app/modules/controllers/home_controller.dart';
import 'package:digitag/app/modules/views/drawer_view.dart';
import 'package:digitag/app/modules/views/home_view.dart';
import 'package:digitag/app/modules/views/profile/audit_on_widget.dart';
import 'package:digitag/app/modules/widgets/appbar.dart';
import 'package:digitag/app/modules/widgets/custom_User_Name_Icons.dart';
import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:digitag/app/modules/widgets/random_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/appbar.dart';
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
    return Scaffold(
        appBar: MyAppBar(
          MediaQuery.of(context).size.width,
          1,
          ctx: context,
          // backButton: IconButton(
          //   onPressed: () {
          //     Get.offAll(
          //       DrawerView(
          //         screen: Get.find<HomeController>().getPreviousScreen(
          //           currentScreen: Screen.profileView,
          //         ),
          //       ),
          //     );
          //   },
          //   icon: const Icon(Icons.arrow_back),
          // ),
        ),
        backgroundColor: const Color(0xff50e6da),
        body: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if ((details.primaryDelta! > 1.0)) {
                ZoomDrawer.of(context)!.toggle();
              } else if (details.primaryDelta! < 10.0) {
                ZoomDrawer.of(context)!.close();
              }
            },
            child: LayoutBuilder(
                builder: (context, constraints) => Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: Decorations.grdntBG,
                      child: SafeArea(
                          child: CustomScrollView(
                              controller: controller.profileScrollController,
                              // dragStartBehavior: DragStartBehavior.down,
                              // physics: const ClampingScrollPhysics(),
                              slivers: [
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                children: [
                                  // controller.openclosetype.value = "profile";
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // CustomUserNameIcons(),
                                        const ProfileStack(),
                                        Obx(
                                          () => FlutterSwitch(
                                            value: controller.status.value,
                                            padding: 2,
                                            onToggle: (val) {
                                              controller.audioSwitchCheck();
                                            },
                                            valueFontSize: 9,
                                            showOnOff: true,
                                            inactiveText: "Audit On",
                                            activeText: "OFF",
                                            width: 75,
                                            height: 27,
                                            inactiveColor:
                                                const Color(0x80004E79),
                                            activeColor:
                                                const Color(0x80004E79),
                                            inactiveToggleColor:
                                                const Color(0x9942FFDD),
                                            inactiveToggleBorder: Border.all(
                                                width: 1,
                                                color: const Color(0x663347B4)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Obx(
                                    () => Expanded(
                                      flex: 4,
                                      child: controller.status.value
                                          ? AuditOnWidget()
                                          : AuditOffWidget(),
                                    ),
                                  ),
                                ],
                              ),

        
                            ),
                          ])),
                    ))));
  }
}


// Column(
//                         children: [
//                           // controller.openclosetype.value = "profile";
//                           Expanded(
//                             flex: 3,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 CustomUserNameIcons(),
//                                 const ProfileStack(),
//                                 Obx(
//                                   () => FlutterSwitch(
//                                     value: controller.status.value,
//                                     padding: 2,
//                                     onToggle: (val) {
//                                       controller.audioSwitchCheck();
//                                     },
//                                     valueFontSize: 9,
//                                     showOnOff: true,
//                                     inactiveText: "Audit On",
//                                     activeText: "OFF",
//                                     width: 75,
//                                     height: 27,
//                                     inactiveColor: const Color(0x80004E79),
//                                     activeColor: const Color(0x80004E79),
//                                     inactiveToggleColor:
//                                         const Color(0x9942FFDD),
//                                     inactiveToggleBorder: Border.all(
//                                         width: 1,
//                                         color: const Color(0x663347B4)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           Obx(
//                             () => Expanded(
//                               flex: 4,
//                               child: controller.status.value
//                                   ? AuditOnWidget()
//                                   : AuditOffWidget(),

//                             ),
//                           ),
//                         ],
//                       ),
                    