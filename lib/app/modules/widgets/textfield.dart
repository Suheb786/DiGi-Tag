import 'package:digitag/app/modules/screens/Login/login_controller.dart';
import 'package:digitag/app/modules/screens/OTP/otp_view_controller.dart';
import 'package:digitag/app/services/auth_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

LoginController loginController = Get.find<LoginController>();

TextFormField CustomField(
    {String? Function(String?)? validator,
    required String hint,
    required TextEditingController controller,
    void Function()? onTap}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    // maxLength: 10,
    controller: controller,
    validator: validator,
    style: const TextStyle(
        color: Color(0xB3002B4A),
        fontFamily: 'Sofia',
        letterSpacing: 1,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        suffixIcon: TextButton(
          child: Text("Send OTP",
              style: TextStyle(
                  fontFamily: "SofiaPro",
                  color: Colors.teal[600],
                  fontWeight: FontWeight.w400)),
          //   style: ,
          onPressed: () {
            Get.find<AuthServiceController>().phoneLogIn(
                "+91 ${Get.find<OtpViewController>().phonenocontroller.text}");
            // print(Get.find<OtpViewController>().phonenocontroller.text);
          },
        ),
        counterText: "",
        // isDense: true,
        filled: true,
        fillColor: Colors.white.withOpacity(0.75),
        contentPadding: EdgeInsets.all(12.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xff4B57B6)),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 131, 66, 14).withOpacity(0.75),
          ),
        ),
        errorStyle: GoogleFonts.montserrat(
            fontSize: 10, color: Colors.white.withOpacity(0.75)),
        hintStyle: TextStyle(color: Color(0xB32278B7), fontFamily: 'Sofia'),
        hintText: hint),
  );
}

//* Password Text Field//

TextFormField passwordTextField() {
  return TextFormField(
    maxLength: 10,
    controller: loginController.passwrodController,
    validator: (value) => loginController.validpassword(value!),
    obscureText: true,
    style: const TextStyle(
      color: Colors.white,
      fontFamily: 'Sofia',
      fontSize: 14,
      letterSpacing: 1,
    ),
    decoration: InputDecoration(
        counterText: "",
        border: InputBorder.none,
        isDense: true,
        filled: true,
        fillColor: Color(0x803F007D),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 133, 40, 33).withOpacity(0.75),
              width: 2),
          borderRadius: BorderRadius.circular(7),
        ),
        errorMaxLines: 2,
        errorStyle: GoogleFonts.montserrat(
            fontSize: 10, color: Colors.white.withOpacity(0.75)),
        contentPadding: EdgeInsets.all(12.0),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.75), width: 2),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide:
                BorderSide(width: 2, color: Color.fromARGB(255, 133, 40, 33))),
        hintStyle: TextStyle(color: Color(0xE6F5F2FF), fontFamily: 'Sofia'),
        hintText: "Password"),
  );
}
