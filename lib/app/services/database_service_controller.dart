import 'dart:convert';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseServiceController extends GetxController {
  final db = FirebaseFirestore.instance;
  @override
  void onInit() async {
    // await getProfile(uid: "zZSEWfdAcKhAukRAUfxf");
    super.onInit();
  }

//* Profile add in database------- >>>>>>>>
  Future<Map<String, dynamic>?> getProfile({required String uid}) async {
    final userData =
        await db.collection("users").doc(uid).get();
    // print(userData.data());
    return userData.data();
  }


  //* Check if device already added in DB :
  Future<bool> deviceExistCheckInDb({required String currentDeviceUID}) async {
    var temp = await db.collection('devicesInfo').doc(currentDeviceUID).get();
    return temp.exists;
  }

    //* Add device details to DB :
  Future<void> addDeviceInfoToDb(Map<String, dynamic> info) async {
    log("Add device info to db called");

    await db.collection("devicesInfo").doc(info['deviceUID']).set(info);
  }

    //* Update device Id in DB :
  Future<void> updateDeviceId(
      {required String docId, required String deviceId}) async {
    log("Update device id called");
    await db
        .collection('devicesInfo')
        .doc(docId)
        .update({'deviceId': deviceId});
  }

   //* Check if device already added in DB :
  Future<bool> userExistCheck({required String uid}) async {
    var temp = await db.collection('users').doc(uid).get();
    return temp.exists;
  }
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
