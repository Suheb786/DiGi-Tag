import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../widgets/profile_details_card.dart';

class AuditOffWidget extends StatelessWidget {
  AuditOffWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 0,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        // child: NotificationListener<OverscrollIndicatorNotification>(
        //   onNotification: (overScroll) {
        //     overScroll.disallowIndicator();
        //     return false;
        //   },
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white54),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ProfileDetailsCard(
                                shadowColor: Color(0xffFF4FF8),
                                mainTitleColor: Color(0xffD25099),
                                mainTitle: "Course",
                                middleTitle: "B.Tech 4*",
                                bottomTitle: "Computer Science",
                              ),
                              ProfileDetailsCard(
                                shadowColor: Color(0xffFFB274),
                                mainTitleColor: Color(0xffF28412),
                                mainTitle: "Roll no.",
                                middleTitle: "1854510012",
                                bottomTitle: "E.No : 185451049580",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ProfileDetailsCard(
                                shadowColor: Color(0xffFC8787),
                                mainTitleColor: Color(0xffE93434),
                                mainTitle: "Contact",
                                middleTitle: "suheb.cse@gmail.com",
                                bottomTitle: "8381824339",
                              ),
                              ProfileDetailsCard(
                                shadowColor: Color(0xff51FF77),
                                mainTitleColor: Color(0xff52BB13),
                                mainTitle: "Medical",
                                middleTitle: "Blood Group A+",
                                bottomTitle: "Vacinated",
                              ),
                            ],
                          ),
                          const ProfileDetailsCard(
                            shadowColor: Color(0xff93FFA4),
                            mainTitleColor: Color(0xff29BC9E),
                            mainTitle: "Address",
                            middleTitle: "Gorakhpur",
                            bottomTitle: "Dakhir Tola Ward no.9 Bansgaon",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      // TODO: social media buttions impl.
                    ),
                  ],
                ),
              ),
            ],
          ),
        

      ),
    );
  }
}





              



          //     CustomScrollView(
          //   // physics: const ClampingScrollPhysics(),
          //   slivers: [
          //     SliverFillRemaining(
          //       hasScrollBody: false,
          //       child: ),
          //   ],
          // ),