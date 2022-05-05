import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/auth_service_controller.dart';

class OtpViewController extends GetxController {
  TextEditingController phonenocontroller = TextEditingController();
  final phonekey = GlobalKey<FormState>();

  validphone(phone) {
    // if (!GetUtils.isPhoneNumber(phone)) {
    //   return "Hey!! Enter a valid No.";
    // }
    // log(phone);
    if (phone.length != 10) {
      return "Hey!! Enter a valid No.";
    } else {
      return null;
    }
  }

  // void phonecheck() {
  //   if (phonekey.currentState!.validate()) {
  //     Get.off(() => HomeView());
  //     //* Impliment otp logic

  //   }
  // }

  void sendOtpTrigger() async {
    if (phonekey.currentState!.validate()) {
      final phoneNo = "+91 ${phonenocontroller.text}";
      log(phoneNo + " : OTP sent called");
      await Get.find<AuthServiceController>().phoneLogIn(phoneNo);
    }
  }

  void submitOtp(){
    
  }

  void startCountDown() {}
}
