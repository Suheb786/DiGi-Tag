import 'package:digitag/app/modules/screens/QrGenerator/qr_generator_controller.dart';
import 'package:get/get.dart';

class QrGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(QrGeneratorController());
  }
}
