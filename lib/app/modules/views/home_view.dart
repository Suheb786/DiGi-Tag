import 'package:digitag/app/Decoration/colors/originBg.dart';
import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/views/profile/audit_off_widget.dart';
import 'package:digitag/app/modules/views/profile/audit_on_widget.dart';
import 'package:digitag/app/modules/widgets/decoration.dart';
import 'package:digitag/app/Decoration/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/appbar.dart';
import '../widgets/random_widgets.dart';

class HomeView extends GetView<HomeController> {
  ProfileController profilecontroller = Get.find<ProfileController>();
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context),
      backgroundColor: const Color(0xff50e6da),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: responsive.height / 40,
                ),
                MedicalSupportIcon(),
                SizedBox(height: responsive.height / 20),
                const ProfileStack(),
                const SizedBox(
                  height: 23,
                ),
                Obx(() => FlutterSwitch(
                      value: profilecontroller.status.value,
                      padding: 2,
                      onToggle: (val) {
                        if (profilecontroller.status.value == false) {
                          profilecontroller.status.value = true;
                        } else {
                          profilecontroller.status.value = false;
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
                      inactiveToggleBorder:
                          Border.all(width: 1, color: const Color(0x663347B4)),
                    )),
                const SizedBox(
                  height: 300,
                ),
                Obx((() => profilecontroller.status.value
                    ? Expanded(child: AuditOnWidget())
                    : IconStack())),
                const SizedBox(
                  height: 65,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
