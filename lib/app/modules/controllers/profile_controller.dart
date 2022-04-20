import 'package:digitag/app/modules/views/drawer_view.dart';
import 'package:digitag/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var status = false.obs;

  ScrollController profileScrollController = ScrollController();
  var scrollOffset = 0.0.obs;
  Future<bool> onBack() async {
    Get.offAllNamed(Routes.DRAWER);
    // ZoomDrawer.of(context)!.close();
    status.value = false;

    return false;
  }

  void audioSwitchCheck() {
    if (status.value == false) {
      status.value = true;
    } else {
      status.value = false;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
