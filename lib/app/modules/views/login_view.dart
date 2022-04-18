import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/login_controller.dart';
import '../widgets/decoration.dart';

import '../../../main.dart';
import '../widgets/bit_text.dart';
import '../widgets/decoration.dart';
import '../controllers/login_controller.dart';
import '../widgets/footerText.dart';

import '../widgets/login_in_widgets.dart';
import '../widgets/textfield.dart';

class LoginView extends GetView<LoginController> {
  @override
  LoginController logincontroller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff2d71b2),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Form(
              key: logincontroller.loginFormKey,
              child: Column(
                children: [
                  SizedBox(height: 65),
                  BigText("Log IN"),
                  SizedBox(height: responsive.height / 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(6, 36),
                                blurRadius: 30,
                                spreadRadius: 0.0,
                              )
                            ]),
                        child: CustomField(
                            validator: (value) =>
                                loginController.uIDvalid(value!),
                            controller: logincontroller.uidController,
                            hint: "Enter UID")),
                  ),
                  SizedBox(height: responsive.height / 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(child: passwordTextField()),
                  ),
                  SizedBox(
                    height: responsive.height / 30,
                  ),
                  CustomHelpText(),
                  SizedBox(
                    height: responsive.height / 30,
                  ),
                  SignUp_Round_Button(
                    extraBigCircle: OverflowBox(
                      maxWidth: 490,
                      maxHeight: 490,
                      child: ClipOval(
                        child: Container(
                          color: const Color(0x0Dffffff),
                        ),
                      ),
                    ),
                    widget: SigninIcon(key: key),
                  ),
                  FooterText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
