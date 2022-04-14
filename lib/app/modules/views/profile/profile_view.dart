import 'package:digitag/app/modules/controllers/home_controller.dart';
import 'package:digitag/app/modules/views/profile/audit_on_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../../Decoration/widgets.dart';
import '../../controllers/profile_controller.dart';
import 'audit_off_widget.dart';

class ProfileView extends GetView<ProfileController> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff50e6da),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Custom_UserName_Icons(),
                      const MedicalSupportIcon(),
                      const ProfileStack(),
                      Obx(
                        () => FlutterSwitch(
                          value: homeController.status.value,
                          padding: 2,
                          onToggle: (val) {
                            if (homeController.status.value == false) {
                              homeController.status.value = true;
                            } else {
                              homeController.status.value = false;
                            }
                          },
                          valueFontSize: 9,
                          showOnOff: true,
                          inactiveText: "Audit On",
                          activeText: "OFF",
                          width: 75,
                          height: 27,
                          inactiveColor: const Color(0x80004E79),
                          activeColor: const Color(0x80004E79),
                          inactiveToggleColor: const Color(0x9942FFDD),
                          inactiveToggleBorder: Border.all(
                              width: 1, color: const Color(0x663347B4)),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Expanded(
                    flex: 4,
                    child: Get.find<HomeController>().status.value
                        ? AuditOffWidget()
                        : AuditOnWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}