import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../services/auth_service_controller.dart';

class OtpViewController extends GetxController {
  var showResendButton = false.obs;
  var seconds = 60.obs;
  Timer? timer;
  TextEditingController phonenocontroller = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final phonekey = GlobalKey<FormState>();

  validphone(phone) {
    if (phone.length != 10) {
      return "Hey!! Enter a valid No.";
    } else {
      return null;
    }
  }

  void sendOtpTrigger() async {
    if (phonekey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.find<AuthServiceController>().isLoadig.value = true;
      final phoneNo = "+91 ${phonenocontroller.text}";
      log(phoneNo + " : OTP sent called");
      await Get.find<AuthServiceController>().phoneLogIn(phoneNo);
    }
  }

  void submitOtp({required BuildContext ctx}) async {
    if (otpController.text.length == 6) {
      Get.find<AuthServiceController>().isLoadingGetIn.value = true;
      await Get.find<AuthServiceController>().submitOtp(
        ctx: ctx,
        pin: otpController.text,
      );
    } else {
      Fluttertoast.showToast(msg: "OTP should be 6 digits");
    }
  }

  void startCountDown() {
    seconds.value = 59;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds--;
      } else {
        timer.cancel();
      }
    });
  }
}
