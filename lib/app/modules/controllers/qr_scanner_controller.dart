import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../views/profile/profile_view.dart';

class QrScannerController extends GetxController {
  var barcode = RxnString(null);
  MobileScannerController cameracontroller = MobileScannerController();
  bool isStarted = true;

  @override
  void onClose() {
    cameracontroller.dispose();

    super.onClose();
  }

  @override
  void dispose() {
    cameracontroller.dispose();
    super.dispose();
  }

  // String? barcode;
}
