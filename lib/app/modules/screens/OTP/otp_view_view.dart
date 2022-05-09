import 'package:digitag/app/modules/widgets/loading_on_auth_state_check.dart';
import 'package:digitag/app/services/auth_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/bit_text.dart';
import '../../widgets/footerText.dart';
import '../../widgets/login_in_widgets.dart';
import '../../widgets/otpField.dart';
import '../../widgets/textfield.dart';
import 'otp_view_controller.dart';

class OtpViewView extends GetView<OtpViewController> {
  const OtpViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          if (Get.find<AuthServiceController>().isLoadingGetIn.value) {
            return const LoadingOnAuthStateCheck();
          } else {
            return LayoutBuilder(
              builder: (context, constraints) => Container(
                height: double.infinity,
                width: double.infinity,
                decoration: Decorations.grdntBG,
                child: Form(
                  key: controller.phonekey,
                  child: Column(
                    children: [
                      SizedBox(height: responsive.height / 10),
                      bigText("DiGi-Tag"),
                      SizedBox(height: responsive.height / 30),
                      const Text(
                        "Enter a Phone No. we will send you an OTP",
                        style:
                            TextStyle(fontFamily: "Sofia", color: Colors.white),
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
                            keyboardType: TextInputType.phone,
                            prefix: const Text("+91 "),
                            validator: (phone) => controller.validphone(phone),
                            hint: 'Enter Your Phone No.',
                            controller: controller.phonenocontroller,
                          ),
                        ),
                      ),
                      SizedBox(height: responsive.height / 30),
                      Obx(() {
                        if (controller.showResendButton.value) {
                          return Column(
                            children: [
                              otpField(),
                              SizedBox(height: responsive.height / 30),
                              resendOTPText(),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      SignUpRoundButton(
                        extraBigCircle: Container(height: 0),
                        widget: InkWell(
                            onTap: () => controller.submitOtp(
                                  ctx: context,
                                ),
                            child: getINicon()),
                      ),
                      FooterText(),
                    ],
                  ),
                ),
              ),
            );
          }
        }));
  }

  RichText resendOTPText() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: "Resend ",
              style: TextStyle(
                  color: Color(0xE6FFC062),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "SofiaPro")),
          const TextSpan(
              text: "OTP in",
              style: TextStyle(
                  color: Colors.white70, fontSize: 14, fontFamily: "SofiaPro")),
          TextSpan(
              text:
                  " 00:${Get.find<OtpViewController>().seconds.value.toString()}",
              style: const TextStyle(
                  color: Colors.white70, fontSize: 14, fontFamily: "SofiaPro")),
          const TextSpan(
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
