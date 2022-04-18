import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var regex = RegExp(
      "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*");

  // final loginFormKey = GlobalKey<FormState>();
  final TextEditingController uidController = TextEditingController();
  final TextEditingController passwrodController = TextEditingController();

  String? uIDvalid(String value) {
    if (value.isEmpty) {
      return "Enter your User ID";
    }
  }

  String? validpassword(String value) {
    if (value.length < 6) {
      return "Password must contain Special, Captial, Small and Numeric Characters";
    } else {
      print("pata ni");
    }
  }

//*testing dispose meathod*//
  @override
  void dispose() {
    uidController.dispose();
    super.dispose();
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
