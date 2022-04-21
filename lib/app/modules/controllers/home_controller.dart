import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime? currentBackPressTime;

  twiceBackToast() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      Fluttertoast.showToast(
          msg: 'Back Twice to Exit DiGi-Tag App',
          backgroundColor: Color(0xffD3D3D3),
          textColor: Colors.black87);
      return Future.value(false);
    }
    return Future.value(true);
  }

  // List<Screen> previousScreens = [Screen.homeView];

  // void addPreviousScreen(Screen screen) {
  //   previousScreens.add(screen);
  //   for (var i = 0; i < previousScreens.length; i++) {
  //     if (previousScreens.length < 2) {
  //       break;
  //     } else {
  //       previousScreens.removeAt(i);
  //     }
  //   }
  //   debugPrint(previousScreens.toList().toString());

  //   if (previousScreens.length > 3) {
  //     previousScreens.removeRange(0, previousScreens.length - 4);
  //   }
  // }

  // Screen getPreviousScreen({required Screen currentScreen}) {
  //   if (currentScreen != previousScreens[previousScreens.length - 2]) {
  //     return previousScreens[previousScreens.length - 2];
  //   } else {
  //     for (int i = previousScreens.length; i >= 0; i--) {
  //       print(previousScreens[i]);
  //       if (previousScreens[i] != currentScreen) {
  //         print("Return ${previousScreens[i]}");
  //       }
  //     }
  //     debugPrint("else block");
  //     return Screen.homeView;
  //   }
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
