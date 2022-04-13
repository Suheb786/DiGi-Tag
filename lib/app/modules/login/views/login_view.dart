import 'dart:ffi';

import 'package:digitag/app/Decoration/widgets.dart';
import 'package:digitag/app/modules/login/widgets/login_in_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  SizedBox(height: 65),
                  const Text(
                    "LogIn",
                    style: TextStyle(
                        fontSize: 45, color: Colors.white, fontFamily: 'Sofia'),
                  ),
                  const SizedBox(height: 35),
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
                        child: uidTextField()),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(child: passwordTextField()),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Custom_Help_Text(),
                  const SignIn_Circle_Stack_Button(),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "UID* is Provided on your Digi-Tag.",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Sofia',
                              color: Color(0xB3FFFFFF),
                            ),
                          ),
                        ),
                      ),
                      const Custom_Contact_Text(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
