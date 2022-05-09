import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();
  var takingScreenShot = false.obs;
  bool? shareTrigger = false;

  @override
  void onInit() {
    try {
      if (Get.arguments['shareProfile']) {
        shareTrigger = true;
      }
    } catch (e) {
      shareTrigger = false;
    }

    super.onInit();
  }

  @override
  void onReady() {
    if (shareTrigger!) {
      shareProfileTrigger();
    }
    super.onReady();
  }

  void shareProfileTrigger() {
    takingScreenShot.value = true;
    screenshotController
        .capture(delay: const Duration(milliseconds: 20))
        .then((image) async {
      // ShowCapturedWidget(
      //     context, capturedImage!);
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath =
            await File('${directory.path}/DiGi-QR | Mohammad Suheb.png')
                .create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
      takingScreenShot.value = false;
    }).catchError((onError) {
      log(onError);
      takingScreenShot.value = false;
    });
  }
}
