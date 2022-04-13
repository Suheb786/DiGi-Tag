import 'package:get/get.dart';

import '../controllers/drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Drawer_Controller>(
      () => Drawer_Controller(),
    );
  }
}
