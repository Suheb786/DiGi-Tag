import 'package:digitag/app/modules/views/qr_scanner.dart';
import 'package:get/get.dart';

class MyController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRScannerView>(
      () => QRScannerView(),
    );
  }
}
