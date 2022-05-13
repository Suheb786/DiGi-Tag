import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:digitag/app/services/database_service_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceIdController extends GetxController {
  @override
  void onInit() async {
    await isDeviceInfoAddedToDb();

    super.onInit();
  }

  //* Add or update new device info to DB using Shared Preferences :
  Future<void> isDeviceInfoAddedToDb() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? boolValue = prefs.getBool('isAdded');
    // log(boolValue.toString());
    log("Shared Prefrences value = ${prefs.getBool('isAdded')}");

    if (boolValue == null) {
      final deviceInfo = await getDeviceInfo();

      if (await Get.find<DatabaseServiceController>()
          .deviceExistCheckInDb(currentDeviceUID: deviceInfo['deviceUID'])) {
        log("Device already exist in db");

        await Get.find<DatabaseServiceController>().updateDeviceId(
          docId: deviceInfo['deviceUID'],
          deviceId: deviceInfo['deviceId'],
        );
        prefs.setBool('isAdded', true);
      } else {
        await Get.find<DatabaseServiceController>()
            .addDeviceInfoToDb(deviceInfo);
        prefs.setBool('isAdded', true);
      }
    }
  }

  //* Get device info (name + deviceId) :
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;

    // log(deviceInfo.androidId.toString());
    return {
      "name": deviceInfo.toMap()['brand'].toUpperCase() +
          " " +
          deviceInfo.toMap()['model'],
      "deviceId": await FirebaseMessaging.instance.getToken(),
      "deviceUID": deviceInfo.androidId,
    };
  }
}
