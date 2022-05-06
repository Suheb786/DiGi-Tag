import 'package:digitag/app/modules/screens/OTP/otp_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

Pinput otpField() {
  return Pinput(
    controller: Get.find<OtpViewController>().otpController,
       androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
    keyboardType: TextInputType.number,

    length: 6,
    hapticFeedbackType: HapticFeedbackType.lightImpact,
    closeKeyboardWhenCompleted: true,
    errorTextStyle:const TextStyle(
        fontFamily: 'SofiaPro', fontSize: 14, color: Colors.redAccent),
    cursor: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color:const Color(0xe65078CC), width: 2))),

    defaultPinTheme: PinTheme(
      textStyle: const TextStyle(
          fontFamily: 'Sofia', fontSize: 14, color: Color(0xB3002B4A)),
      height: 37,
      width: 37,
      decoration: BoxDecoration(
          color:const  Color(0xBfffffff), borderRadius: BorderRadius.circular(7)),
    ),
    focusedPinTheme: PinTheme(
      textStyle: const TextStyle(
          fontFamily: 'Sofia', fontSize: 14, color: Color(0xB3002B4A)),
      height: 37,
      width: 37,
      decoration: BoxDecoration(
        color:const Color(0xbfffffff),
        borderRadius: BorderRadius.circular(7),
      ),
    ),
  );
}
