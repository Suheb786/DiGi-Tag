import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/controllers/qr_generator_controller.dart';

import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:digitag/app/modules/widgets/qr_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/appbar.dart';
import '../../widgets/audit_toggle_button.dart';
import '../../widgets/custom_appbar.dart';
import '../profile/audit_off_widget.dart';
import '../profile/audit_on_widget.dart';

class QrGeneratorView extends GetView<QrGeneratorController> {
  const QrGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.find<ProfileController>().onBack(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: myAppBar(
          MediaQuery.of(context).size.width,
          ctx: context,
          userName: "Mohammad Suheb",
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: ProfileStack(),
                ),
                const Expanded(
                  flex: 3,
                  child: QrStack(
                    uid: 'JIT185451003',
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "JIT185451003",
                          style: TextStyle(
                            fontFamily: "SofiaPro",
                            fontSize: 20,
                            color: const Color(0xffD2E7FF).withOpacity(0.8),
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(0, 4.0),
                                blurRadius: 10.0,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                          ),
                        ),
                        TextButton.icon(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Color.fromRGBO(210, 231, 255, 0.8),
                          ),
                          label: const Text(
                            "Share my profile",
                            style: TextStyle(
                              color: Color.fromRGBO(210, 231, 255, 0.8),
                              fontFamily: "Sofia",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
