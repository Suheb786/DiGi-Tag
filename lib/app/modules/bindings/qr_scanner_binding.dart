import 'package:digitag/app/modules/controllers/qr_scanner_controller.dart';
import 'package:digitag/app/modules/views/qr_scanner.dart';
import 'package:get/get.dart';

class QrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScannerController>(() => QrScannerController());
  }
}
