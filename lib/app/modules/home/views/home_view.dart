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
                Custom_UserName_Icons(),
                                SizedBox(height: 30,)
,
                const MedicalSupportIcon(),
                SizedBox(height: 30,),
                const ProfileStack(),
                const SizedBox(
                  height: 40,
                ),
                Obx(() => CustomSwitch(status: status)),
                const SizedBox(
                  height: 360,
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

