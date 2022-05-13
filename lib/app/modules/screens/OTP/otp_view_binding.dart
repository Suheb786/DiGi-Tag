import 'package:get/get.dart';

import 'otp_view_controller.dart';

class OtpViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpViewController>(
      () => OtpViewController(),
    );
  }
}
