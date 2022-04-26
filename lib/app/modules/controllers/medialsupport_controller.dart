import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MedicalsupportController extends GetxController {
  TextEditingController title = TextEditingController();

  //TODO: Implement MedialsupportController
  File? pickedImage;
  final ImagePicker picker = ImagePicker();

  String? titleValidation(String value) {
    if (value.isEmpty) {
      return "Enter your User ID";
    }
  }

  void picImageCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
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
