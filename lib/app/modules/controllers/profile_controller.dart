import 'package:digitag/app/modules/views/drawer_view.dart';
import 'package:digitag/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var status = false.obs;
  var wrapPadding = 50.0.obs;
  var spacing = 5.0.obs;

  ScrollController profileScrollController = ScrollController();
  var scrollOffset = 0.0.obs;

  void updatePadding() {
    // print(profileScrollController.offset);

    var offSet = profileScrollController.offset;
    // if (profileScrollController.offset > 100) {
    //   wrapPadding.value = 70;
    // } else if (profileScrollController.offset > 150) {
    //   wrapPadding.value = 90;
    // }
    if (offSet >= 0 && offSet <= 50) {
      wrapPadding.value = 50;
      spacing.value = 5;
    } else if (offSet >= 51 && offSet <= 100) {
      wrapPadding.value = 70;
      spacing.value = 10;
    } else if (offSet >= 101 && offSet <= 120) {
      wrapPadding.value = 100;
      spacing.value = 15;
    } else {}
  }

  Future<bool> onBack() async {
    if (status.value) {
      status.value = false;
      return false;
    } else {
      Get.offAllNamed(Routes.DRAWER);
      // ZoomDrawer.of(context)!.close();
      status.value = false;

      return false;
    }
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
    profileScrollController.addListener(() => updatePadding());
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
