import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseServiceController extends GetxController {
  @override
  void onInit() async {
    // await getProfile(uid: "zZSEWfdAcKhAukRAUfxf");
    super.onInit();
  }

  Stream<dynamic> auditstream =
      FirebaseFirestore.instance.collection('audits').snapshots();

//* Profile add in database------- >>>>>>>>
  Future<Map<String, dynamic>?> getProfile({required String uid}) async {
    final userData =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    // print(userData.data());
    return userData.data();
  }

  Future addUsers(Map<String, dynamic> userData) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final users = await firestore.collection('users').add(userData);
  }

//**** Audit add in database -------->>>

  dynamic getAudit() async {
    QuerySnapshot userFeedback =
        await FirebaseFirestore.instance.collection("audits").get();

    return userFeedback;
  }

  Future addAudit(Map<String, dynamic> userfeedback) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final users = await firestore.collection('audits').add(userfeedback);
    print("AddAudit $users");
  }
}


//  ProfileDetailsCard(
                  //       assetImagePath:
                  //           "assets/icons/profile_icons/courseIcon.jpg",
                  //       shadowColor: Color(0xffFF4FF8),
                  //       mainTitleColor: Color(0xffD25099),
                  //       mainTitle: "Course",
                  //       middleTitle: //TODO Semester need to be replaced by year
                  //           "${profileController.userData!["course"]} ${profileController.userData!['semester']}",
                  //       bottomTitle: profileController.userData!["branch"],
                  //     ),
                  //     ProfileDetailsCard(
                  //         assetImagePath:
                  //             "assets/icons/profile_icons/rollnoIcon.jpg",
                  //         shadowColor: Color(0xffFFB274),
                  //         mainTitleColor: Color(0xffF28412),
                  //         mainTitle: "Roll no.",
                  //         middleTitle: profileController.userData!["roll_no"],
                  //         bottomTitle: "" //TODO phone no,
                  //         ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ProfileDetailsCard(
                  //       assetImagePath:
                  //           "assets/icons/profile_icons/contactIcon.jpg",
                  //       shadowColor: Color(0xffFC8787),
                  //       mainTitleColor: Color(0xffE93434),
                  //       mainTitle: "Contact",
                  //       middleTitle: profileController.userData!["email"],
                  //       bottomTitle:
                  //           "ENo : ${profileController.userData!["enrollment_no"]}",
                  //     ),