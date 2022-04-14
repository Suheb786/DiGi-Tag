import 'package:flutter/material.dart';

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
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white54),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class ProfileDetailsCard extends StatelessWidget {
  final String mainTitle;
  final String middleTitle;
  final String bottomTitle;
  final Color? mainTitleColor;
  const ProfileDetailsCard({
    Key? key,
    required this.mainTitleColor,
    required this.mainTitle,
    required this.middleTitle,
    required this.bottomTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mainTitle,
                      style: TextStyle(
                        fontFamily: "Sofia",
                        fontSize: 18,
                        color: mainTitleColor,
                      ),
                    ),
                    const CircleAvatar(),
                  ],
                ),
                Text(
                  middleTitle,
                  style: TextStyle(
                    fontFamily: middleTitle,
                    fontSize: 12,
                    color: Color(0xff5B5B5B),
                  ),
                ),
                Text(
                  bottomTitle,
                  style: const TextStyle(
                    fontFamily: "Sofia",
                    fontSize: 12,
                    color: Color(0xff5B5B5B),
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
