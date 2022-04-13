//?-----------------LOGIN SCREEN -------------------------//
//* User Id Text Field//

import 'package:digitag/app/modules/views/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextFormField uidTextField() {
  return TextFormField(
    style: const TextStyle(
        color: Color(0xB3002B4A),
        fontFamily: 'Sofia',
        letterSpacing: 1,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white.withOpacity(0.75),
        contentPadding: EdgeInsets.all(12.0),
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
            color: Colors.red.withOpacity(0.75),
          ),
        ),
        hintStyle: TextStyle(color: Color(0xB32278B7), fontFamily: 'Sofia'),
        hintText: "Enter UID*"),
  );
}

//* Password Text Field//
TextFormField passwordTextField() => TextFormField(
    obscureText: true,
    style: const TextStyle(
      color: Colors.white,
      fontFamily: 'Sofia',
      fontSize: 14,
      letterSpacing: 1,
    ),
    decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        filled: true,
        fillColor: Color(0x803F007D),
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
            borderSide: BorderSide.none),
        hintStyle: TextStyle(color: Color(0xE6F5F2FF), fontFamily: 'Sofia'),
        hintText: "Password"));

//* ---Signin Icon -- //
class SigninIcon extends StatelessWidget {
  const SigninIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/Sign _In_Button.png');
  }
}

//* OverFlow Stack Circle for SignIn Button and bottom info Text //
class SignIn_Circle_Stack_Button extends StatelessWidget {
  const SignIn_Circle_Stack_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            OverflowBox(
              maxWidth: 490,
              maxHeight: 490,
              child: ClipOval(
                child: Container(
                  color: Color(0x0Dffffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 292,
              maxWidth: 292,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 224,
              maxWidth: 224,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            OverflowBox(
              maxHeight: 135,
              maxWidth: 135,
              child: ClipOval(
                child: Container(
                  color: Color(0x1Affffff),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => HomeView());
              },
              child: const OverflowBox(
                maxWidth: 68,
                maxHeight: 68,
                child: SigninIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//* Help Rich Text //
class Custom_Help_Text extends StatelessWidget {
  const Custom_Help_Text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        print("show Help Screen");
      }),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Need ",
              style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  color: Color(0xB3FFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "Help ",
              style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  color: Color(0xffFFD952),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "for Password ?",
              style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  color: Color(0xB3FFFFFF),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

//*Conact Softkru or Administrator Text Button//
class Custom_Contact_Text extends StatelessWidget {
  const Custom_Contact_Text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "To SignUp contact to ",
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Sofia',
                  color: Color(0xB3FFFFFF),
                ),
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("We have to put Login of SoftKru Direct Mail");
                  },
                text: "SoftKru ",
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Sofia',
                  color: Color(0xffFF8CD1),
                ),
              ),
              TextSpan(
                text: "or your ",
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Sofia',
                  color: Color(0xB3FFFFFF),
                ),
              ),
              TextSpan(
                text: "Administration",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("show Screen Something Related to Adminstration");
                  },
                style: TextStyle(
                  fontFamily: 'Sofia',
                  fontSize: 11,
                  color: Color(0xCC82FF8E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
