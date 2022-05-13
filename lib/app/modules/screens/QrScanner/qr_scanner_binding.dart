import 'package:digitag/app/modules/screens/QrScanner/qr_scanner_controller.dart';
import 'package:get/get.dart';

class QrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScannerController>(() => QrScannerController());
  }
}
