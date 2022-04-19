import 'package:digitag/app/modules/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class OtpViewController extends GetxController {
  TextEditingController phonenocontroller = TextEditingController();
  final phonekey = GlobalKey<FormState>();

  validphone(phone) {
    if (!GetUtils.isPhoneNumber(phone)) {
      return "Hey!! Enter a valid No.";
    }
  }

  phonecheck() {
    if (phonekey.currentState!.validate()) {
      Get.off(() => HomeView());
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
