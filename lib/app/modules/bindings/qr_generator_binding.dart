import 'package:digitag/app/modules/controllers/qr_generator_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class QrGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(QrGeneratorController());
  }

}
