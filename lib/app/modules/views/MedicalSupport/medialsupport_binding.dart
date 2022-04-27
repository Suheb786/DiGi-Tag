import 'package:get/get.dart';

import 'medialsupport_controller.dart';

class MedialsupportBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MedialsupportController>(
    //   () => MedialsupportController(),
    Get.put(MedicalsupportController());
  }
}
