import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/services/auth_service_controller.dart';
import 'package:get/get.dart';

import '../models/device_list.dart';

class DatabaseServiceController extends GetxController {
  @override
  void onInit() async {
    // await getProfile(uid: "zZSEWfdAcKhAukRAUfxf");
    super.onInit();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;

//* Profile add in database------- >>>>>>>>
  Future<Map<String, dynamic>?> getProfile({required String uid}) async {
    final userData =
        await db.collection("users").doc("9sFX0SQlMGMiaqPDeW3v").get();
    // print(userData.data());
    return userData.data();
  }

  Future addUsers(Map<String, dynamic> userData) async {
    try {
      await db
          .collection('users')
          .doc(Get.find<AuthServiceController>().getUid)
          .set(userData);
    } catch (e) {
      log(e.toString());
    }
  }

  dynamic getAudit() async {
    QuerySnapshot userFeedback = await db
        .collection("audits")
        // .orderBy("postedAt", descending: true)
        .get();

    return userFeedback;
  }

//**** Audit add in database -------->>>
  Future addAudit(Map<String, dynamic> userfeedback) async {
    final users = await db.collection('audits').add(userfeedback);
    log("AddAudit $users");
  }

//* Check if device already added in DB :
  Future<bool> deviceExistCheckInDb({required String currentDeviceUID}) async {
    var temp = await db.collection('devicesInfo').doc(currentDeviceUID).get();
    return temp.exists;
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

  //* Check if user already added in DB :
  Future<bool> userExistCheck({required String uid}) async {
    var temp = await db.collection('users').doc(uid).get();
    return temp.exists;
  }

  //* Add device details to DB :
  Future<void> addDeviceInfoToDb(Map<String, dynamic> info) async {
    log("Add device info to db called");

    await db.collection("devicesInfo").doc(info['deviceUID']).set(info);
  }

  Future<List<DeviceList>> readDevices() async {
    var deviceList = db.collection("devicesInfo").snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => DeviceList.fromJSON(
                  doc.data(),
                ),
              )
              .toList(),
        );
    List<DeviceList> listDevice = await deviceList.first;
    log("Pushing notifications to ${listDevice.length.toString()} devices");
    return listDevice;
  }
}
