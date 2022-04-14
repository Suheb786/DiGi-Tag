import 'package:flutter/material.dart';

import '../../widgets/profile_details_card.dart';

class AuditOffWidget extends StatelessWidget {
  const AuditOffWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white54),
                    ),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ProfileDetailsCard(
                                    mainTitleColor: Color(0xffD25099),
                                    mainTitle: "Course",
                                    middleTitle: "B.Tech 4*",
                                    bottomTitle: "Computer Science",
                                  ),
                                  ProfileDetailsCard(
                                    mainTitleColor: Color(0xffF28412),
                                    mainTitle: "Roll no.",
                                    middleTitle: "1854510012",
                                    bottomTitle: "E.No : 185451049580",
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ProfileDetailsCard(
                                    mainTitleColor: Color(0xffE93434),
                                    mainTitle: "Contact",
                                    middleTitle: "suheb.cse@gmail.com",
                                    bottomTitle: "8381824339",
                                  ),
                                  ProfileDetailsCard(
                                    mainTitleColor: Color(0xff52BB13),
                                    mainTitle: "Medical",
                                    middleTitle: "Blood Group A+",
                                    bottomTitle: "Vacinated",
                                  ),
                                ],
                              ),
                              const ProfileDetailsCard(
                                mainTitleColor: Color(0xff29BC9E),
                                mainTitle: "Address",
                                middleTitle: "Gorakhpur",
                                bottomTitle: "Dakhir Tola Ward no.9 Bansgaon",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // TODO: social media buttions impl.

                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
