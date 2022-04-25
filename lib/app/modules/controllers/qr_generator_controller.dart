import 'package:get/state_manager.dart';
import 'package:screenshot/screenshot.dart';

class QrGeneratorController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();
  var takingScreenShot = false.obs;
}
