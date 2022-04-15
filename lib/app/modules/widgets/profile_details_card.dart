import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        padding: const EdgeInsets.all(5.0),
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
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          mainTitle,
                          style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 18,
                            color: mainTitleColor,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: mainTitleColor,
                      // child: SvgPicture.asset(
                      //   'assets/profile_icons/contactIcon.svg',
                      //   alignment: Alignment.center,
                      // ),
                    ),
                  ],
                ),
                FittedBox(
                  child: Text(
                    middleTitle,
                    style: TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 12,
                      color: Color(0xff5B5B5B),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    bottomTitle,
                    style: const TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 12,
                      color: Color(0xff5B5B5B),
                    ),
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
