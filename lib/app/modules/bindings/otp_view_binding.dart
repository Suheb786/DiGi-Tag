import 'package:get/get.dart';

import '../controllers/otp_view_controller.dart';

class OtpViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpViewController>(
      () => OtpViewController(),
    );
  }
}
