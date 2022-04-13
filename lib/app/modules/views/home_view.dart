import 'package:digitag/app/Decoration/colors/originBg.dart';
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
import '../widgets/random_widgets.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  var status = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         ZoomDrawer.of(context)!.toggle();
      //       },
      //       icon: Icon(Icons.snapchat)),
      //   // actions: [
      //   //   IconButton(
      //   //       onPressed: () {
      //   //         ZoomDrawer.of(context)!.toggle();
      //   //       },
      //   //       icon: Icon(Icons.snapchat))
      //   // ],
      //   backgroundColor: Colors.transparent,
      //   title: Text("Hi, Mohammad"),
      //   elevation: 0,
      // ),
      backgroundColor: Color(0xff50e6da),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                Custom_UserName_Icons(),
                const Spacer(),
                const MedicalSupportIcon(),
                const Spacer(),
                const ProfileStack(),
                const SizedBox(
                  height: 23,
                ),
                Obx(() => FlutterSwitch(
                      value: status.value,
                      padding: 2,
                      onToggle: (val) {
                        if (status.value == false) {
                          status.value = true;
                          print("Audit On");
                        } else {
                          status.value = false;
                          print("Audit Off");
                        }
                      },
                      valueFontSize: 9,
                      showOnOff: true,
                      inactiveText: "Audit On",
                      activeText: "OFF",
                      width: 75,
                      height: 27,
                      inactiveColor: Color(0x80004E79),
                      activeColor: Color(0x80004E79),
                      inactiveToggleColor: Color(0x9942FFDD),
                      inactiveToggleBorder:
                          Border.all(width: 1, color: Color(0x663347B4)),
                    )),
                const SizedBox(
                  height: 300,
                ),
                IconStack(),
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