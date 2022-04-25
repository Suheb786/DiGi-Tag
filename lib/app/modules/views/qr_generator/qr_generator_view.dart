import 'dart:io';
import 'dart:typed_data';

import 'package:digitag/app/Decoration/text/text.dart';
import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/controllers/qr_generator_controller.dart';

import 'package:digitag/app/modules/widgets/profile_Stack.dart';
import 'package:digitag/app/modules/widgets/qr_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

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
            child: Screenshot(
              controller: controller.screenshotController,
              child: Obx(
                () => Stack(
                  children: [
                    Visibility(
                      visible: controller.takingScreenShot.value,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: Decorations.grdntBG,
                      ),
                    ),
                    Column(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: ProfileStack(),
                        ),
                        Visibility(
                          visible: controller.takingScreenShot.value,
                          child: Expanded(
                              flex: 1,
                              child: Center(
                                  child: customText("Mohammad Suheb", 20))),
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
                                    color: const Color(0xffD2E7FF)
                                        .withOpacity(0.8),
                                    shadows: const <Shadow>[
                                      Shadow(
                                        offset: Offset(0, 4.0),
                                        blurRadius: 10.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: !controller.takingScreenShot.value,
                                  child: TextButton.icon(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    onPressed: () {
                                      controller.takingScreenShot.value = true;
                                      controller.screenshotController
                                          .capture(
                                              delay: Duration(milliseconds: 20))
                                          .then((image) async {
                                        // ShowCapturedWidget(
                                        //     context, capturedImage!);
                                         if (image != null) {
                                          final directory =
                                              await getApplicationDocumentsDirectory();
                                          final imagePath = await File(
                                                  '${directory.path}/DiGi-QR | Mohammad Suheb.png')
                                              .create();
                                          await imagePath.writeAsBytes(image);

                                          /// Share Plugin
                                          await Share.shareFiles(
                                              [imagePath.path]);
                                        }
                                        controller.takingScreenShot.value =
                                            false;
                                      }).catchError((onError) {
                                        print(onError);
                                        controller.takingScreenShot.value =
                                            false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.share,
                                      color: Color.fromRGBO(210, 231, 255, 0.8),
                                    ),
                                    label: const Text(
                                      "Share my profile",
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(210, 231, 255, 0.8),
                                        fontFamily: "Sofia",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Center(
          child: capturedImage != null
              ? Image.memory(capturedImage)
              : Container()),
    ),
  );
}
