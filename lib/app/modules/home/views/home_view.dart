import 'package:digitag/app/Decoration/colors/originBg.dart';
import 'package:digitag/app/Decoration/decoration.dart';
import 'package:digitag/app/Decoration/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../Decoration/widgets.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d71b2),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 56,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Container(
                      child: customText("Hi, Mohammad", 20),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 35,
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/Vector.svg')),
                    const Spacer(),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/Bell.svg')),
                    const Spacer(),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/drawer.svg')),
                    const Spacer()
                  ],
                ),
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
                      showOnOff: true,
                      inactiveText: "Audit",
                      activeText: "Audit",
                      width: 73,
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
                const IconStack(),
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
