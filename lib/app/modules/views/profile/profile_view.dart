import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../../Decoration/widgets.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/appbar.dart';
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
        appBar: MyAppBar(MediaQuery.of(context).size.width, 1),
        backgroundColor: const Color(0xff50e6da),
        body: LayoutBuilder(
            builder: (context, constraints) => Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: Decorations.grdntBG,
                  child: SafeArea(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return false;
                      },
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
                                  flex: controller.scrollOffset.value <= 50
                                      ? 4
                                      : 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Custom_UserName_Icons(),

                                      // (controller.scrollOffset.value)<=50.0: ProfileStack():SizedBox.shrink(),

                                      Obx(() {
                                        if (controller.scrollOffset.value <=
                                            50) {
                                          return ProfileStack();
                                        } else {
                                          return SizedBox.shrink();
                                        }
                                      }),
                                      Obx(
                                        () => FlutterSwitch(
                                          value: controller.status.value,
                                          padding: 2,
                                          onToggle: (val) {
                                            if (controller.status.value ==
                                                false) {
                                              controller.status.value = true;
                                            } else {
                                              controller.status.value = false;
                                            }
                                          },
                                          valueFontSize: 9,
                                          showOnOff: true,
                                          inactiveText: "Audit On",
                                          activeText: "OFF",
                                          width: 75,
                                          height: 27,
                                          inactiveColor:
                                              const Color(0x80004E79),
                                          activeColor: const Color(0x80004E79),
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
                                    flex: 6,
                                    child: controller.status.value
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
                  ),
                )));
  }
}
