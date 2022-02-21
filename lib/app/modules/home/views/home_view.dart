import 'package:digitag/app/Decoration/colors/originBg.dart';
import 'package:digitag/app/Decoration/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                Text("Hi, Mohammad"),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 164,
                        width: 164,
                        color: Color(0x1Affffff),
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        height: 146,
                        width: 146,
                        color: Color(0x33ffffff),
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        height: 124,
                        width: 124,
                        color: Color(0x40ffffff),
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        child: Image.asset(
                          'assets/images/demopic.png',
                        ),
                        height: 104,
                        width: 104,
                        decoration: const BoxDecoration(
                            color: Color(0x4Dffffff),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 490,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        OverflowBox(
                          maxWidth: 536,
                          maxHeight: 536,
                          child: ClipOval(
                            child: Container(
                              color: Color(0x0Dffffff),
                            ),
                          ),
                        ),
                        OverflowBox(
                          maxHeight: 312,
                          maxWidth: 312,
                          child: ClipOval(
                            child: Container(
                              color: Color(0x1Affffff),
                            ),
                          ),
                        ),
                        OverflowBox(
                          maxHeight: 244,
                          maxWidth: 244,
                          child: ClipOval(
                            child: Container(
                              color: Color(0x1Affffff),
                            ),
                          ),
                        ),
                        OverflowBox(
                          maxHeight: 155,
                          maxWidth: 155,
                          child: ClipOval(
                            child: Container(
                              color: Color(0x1Affffff),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: OverflowBox(
                            maxWidth: 78,
                            maxHeight: 78,
                            child: ScanIcon(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
