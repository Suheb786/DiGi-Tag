import 'dart:developer';
import 'dart:io';

import 'package:digitag/app/models/notification.dart';
import 'package:digitag/app/services/Notifications/pushNotification_controller.dart';
import 'package:digitag/app/services/auth_service_controller.dart';
import 'package:digitag/app/services/database_service_controller.dart';
import 'package:digitag/app/services/storage_service_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MedicalsupportController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController emergencyAlertDescription = TextEditingController();

  //TODO: Implement MedialsupportController
  File? pickGeneralImage;
  File? pickedImage;
  var isLoading = false.obs;
  // final ImagePicker picker = ImagePicker();

  String? titleValidation(String value) {
    if (value.isEmpty) {
      return "Enter your User ID";
    }
    return null;
  }

  void openEmergencyCamera(BuildContext context) async {
    final pickAFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 30,
    );

    if (pickAFile != null) {
      pickedImage = File(pickAFile.path);
    } else {
      pickedImage = null;
    }
    update();
  }

  void openGeneralCamera() async {
    var pickedGeneralFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedGeneralFile != null) {
      pickGeneralImage = File(pickedGeneralFile.path);
    } else {
      pickGeneralImage = null;
    }
    update();
  }

  Future<void> sendEmergencyNotification() async {
    final imageUrl =
        await Get.find<StorageServiceController>().upladImageToFirebaseStorage(
      path: 'notification',
      file: pickedImage!,
      fileName: DateTime.now().toString(),
    );
    final NotificationModel notification = NotificationModel(
        time: DateTime.now(),
        version: 1,
        title: "",
        body: emergencyAlertDescription.text,
        imageUrls: [imageUrl!],
        sendBy: Get.find<AuthServiceController>().getUid,
        type: "emergency");

    log("Notification Data : ${notification.toMap().toString()}");
    await Get.find<DatabaseServiceController>()
        .emergencyNotification(notification);
    await Get.find<PushNotificationController>().pushNotificationTrigger(
      title: "Emergency Alert",
      body: notification.body,
      imageUrl: imageUrl,
    );
    isLoading.value = false;
    Get.snackbar(
      "",
      "",
      backgroundColor: Colors.green,
      borderRadius: 5,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      dismissDirection: DismissDirection.horizontal,
      icon: const Icon(
        Icons.check_rounded,
        color: Colors.white,
      ),
      titleText: Text(
        "Successful",
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, color: Colors.white),
      ),
      messageText: Text(
        "Emergency Alert broadcasted",
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}
