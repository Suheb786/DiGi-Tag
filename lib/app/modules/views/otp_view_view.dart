import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Decoration/decoration.dart';
import '../controllers/otp_view_controller.dart';
import '../widgets/bit_text.dart';
import '../widgets/footerText.dart';
import '../widgets/login_in_widgets.dart';
import '../widgets/otpField.dart';
import '../widgets/textfield.dart';

class OtpViewView extends GetView<OtpViewController> {
  const OtpViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: Form(
            // key: controller.phonekey,
            child: Column(
              children: [
                SizedBox(height: responsive.height / 10),
                bigText("DiGi-Tag"),
                SizedBox(height: responsive.height / 30),
                const Text(
                  "Enter a Phone No. we will send you an OTP",
                  style: TextStyle(fontFamily: "Sofia", color: Colors.white),
                ),
                SizedBox(height: responsive.height / 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(64, 30, 32, 56),
                            offset: Offset(6, 36),
                            blurRadius: 40,
                            spreadRadius: 0.0,
                          )
                        ]),
                    child: CustomField(
                        validator: (phone) => controller.validphone(phone),
                        hint: 'Enter Your Phone No.',
                        controller: loginController.uidController),
                  ),
                ),
                SizedBox(height: responsive.height / 30),
                OTPField(),
                SizedBox(height: responsive.height / 30),
                resendOTPText(),
                SignUpRoundButton(
                  extraBigCircle: Container(height: 0),
                  widget: InkWell(
                      onTap: () {
                        controller.phonecheck();
                      },
                      child: getINicon()),
                ),
                FooterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText resendOTPText() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
              text: "Resend ",
              style: TextStyle(
                  color: Color(0xE6FFC062),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "SofiaPro")),
          TextSpan(
              text: "OTP in",
              style: TextStyle(
                  color: Colors.white70, fontSize: 14, fontFamily: "SofiaPro")),
          TextSpan(
              text: " 00:45",
              style: TextStyle(
                  color: Colors.white70, fontSize: 14, fontFamily: "SofiaPro")),
          TextSpan(
              text: " sec",
              style: TextStyle(
                  color: Colors.white70, fontSize: 14, fontFamily: "SofiaPro")),
        ],
      ),
    );
  }

  OverflowBox getINicon() {
    return OverflowBox(
      maxHeight: 68,
      minHeight: 68,
      child: Image.asset('assets/icons/GetINButton.png'),
    );
  }
}
