import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MedicalsupportController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController comment = TextEditingController();

  //TODO: Implement MedialsupportController
  File? pickGeneralImage;
  File? pickedImage;
  // final ImagePicker picker = ImagePicker();

  String? titleValidation(String value) {
    if (value.isEmpty) {
      return "Enter your User ID";
    }
  }

  void openEmergencyCamera(BuildContext context) async {
    final pickAFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
