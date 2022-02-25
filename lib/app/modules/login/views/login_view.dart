import 'package:digitag/app/Decoration/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d71b2),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    const Text(
                      "LogIn",
                      style: TextStyle(
                          fontSize: 47,
                          color: Colors.white,
                          fontFamily: 'Sofia'),
                    ),
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
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(child: passwordTextField()),
                    ),
                    IconStack(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
