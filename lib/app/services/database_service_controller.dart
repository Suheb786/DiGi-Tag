import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseServiceController extends GetxController {
  @override
  void onInit() async {
    // await getProfile(uid: "zZSEWfdAcKhAukRAUfxf");
    super.onInit();
  }

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

  dynamic getAudit() async {
    QuerySnapshot userFeedback = await FirebaseFirestore.instance
        .collection("audits")
        // .orderBy("postedAt", descending: true)
        .get();

    return userFeedback;
  }

//**** Audit add in database -------->>>
  Future addAudit(Map<String, dynamic> userfeedback) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final users = await firestore.collection('audits').add(userfeedback);
    print("AddAudit $users");
  }
}
