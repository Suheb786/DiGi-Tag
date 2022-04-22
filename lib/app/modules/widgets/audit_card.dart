import 'package:digitag/app/Decoration/enums/voting.dart';
import 'package:flutter/material.dart';

import '../../Decoration/colors/app_colors.dart';

class AuditCardWidget extends StatelessWidget {
  final String message;
  final String facultyName;
  final String userImageUrl;
  final String branch;
  final Voting voting;

  const AuditCardWidget({
    Key? key,
    required this.facultyName,
    required this.message,
    required this.userImageUrl,
    required this.branch,
    required this.voting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          // TODO: Impliment network image here
                          image: Image.asset(
                            userImageUrl,
                          ).image),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  facultyName,
                  style: TextStyle(
                    fontFamily: "SofiaPro",
                    fontWeight: FontWeight.bold,
                    color: AppColors.auditOnCardName,
                  ),
                ),
                Spacer(),
                Text(
                  branch,
                  style: TextStyle(
                    fontFamily: "SofiaPro",
                    fontStyle: FontStyle.italic,
                    color: AppColors.auditOnCardBranch,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                // fit: StackFit.expand,
                children: [
                  InkWell(
                    onTap: (() => showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text(
                                facultyName,
                                style: TextStyle(
                                  fontFamily: "SofiaPro",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.auditOnCardName,
                                ),
                              ),
                              backgroundColor: Colors.white.withOpacity(0.9),
                              content: Text(
                                message,
                                style: TextStyle(
                                  fontFamily: "SofiaPro",
                                  color: AppColors.auditCardBodyTextColor,
                                ),
                              ),
                            );
                          },
                        )),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.80),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // "This fodfd fdofkej laok okdfo kof eno dni fodef fkgro bvlo gkfo fgo",
                        message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: "SofiaPro",
                          fontWeight: FontWeight.w700,
                          color: AppColors.auditCardBodyTextColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -12,
                    right: -12,
                    // child: CircleAvatar(
                    //   radius: 15,
                    //   // backgroundImage: AssetImage(
                    //   //   "assets/icons/profile_icons/like_Icon.png",
                    //   // ),
                    //   child: Image.asset(
                    //     "assets/icons/profile_icons/like_Icon.png",
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),

                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: Image.asset(
                                voting == Voting.up
                                    ? "assets/icons/profile_icons/like_Icon.png"
                                    : "assets/icons/profile_icons/dislikeIcon.png",
                              ).image),
                          shape: BoxShape.circle),
                    ),
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
