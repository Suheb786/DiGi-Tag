import 'package:digitag/app/Decoration/colors/originBg.dart';
import 'package:digitag/app/Decoration/decoration.dart';
import 'package:digitag/app/Decoration/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../Decoration/widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2d71b2),
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Decorations.grdntBG,
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
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
                    Spacer(
                      flex: 4,
                    ),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/Vector.svg')),
                    Spacer(),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/Bell.svg')),
                    Spacer(),
                    InkWell(
                        onTap: (() {}),
                        child: SvgPicture.asset('assets/icons/drawer.svg')),
                    Spacer()
                  ],
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0x26ffffff)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/MedicalSupport.svg',
                    ),
                  ),
                ),
                Spacer(),
                const ProfileStack(),
                Spacer(
                  flex: 11,
                ),
                const IconStack(),
                SizedBox(
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
