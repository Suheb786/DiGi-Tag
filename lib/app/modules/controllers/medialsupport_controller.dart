import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MedialsupportController extends GetxController {
  TextEditingController title = TextEditingController();

  //TODO: Implement MedialsupportController
  XFile? imagepath;
  final ImagePicker picker = ImagePicker();

  String? titleValidation(String value) {
    if (value.isEmpty) {
      return "Enter your User ID";
    }
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
