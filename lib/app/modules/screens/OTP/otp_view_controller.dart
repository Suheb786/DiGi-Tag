import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Home/home_view.dart';

class OtpViewController extends GetxController {
  TextEditingController phonenocontroller = TextEditingController();
  final phonekey = GlobalKey<FormState>();

  validphone(phone) {
    if (!GetUtils.isPhoneNumber(phone)) {
      return "Hey!! Enter a valid No.";
    }
  }

  void phonecheck() {
    if (phonekey.currentState!.validate()) {
      Get.off(() => HomeView());
      //* Impliment otp logic
    }
  }

  void startCountDown() {}
}
