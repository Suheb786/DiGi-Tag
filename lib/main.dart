import 'package:digitag/app/modules/controllers/home_controller.dart';
import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/controllers/qr_scanner_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import 'app/Theme/theme.dart';
import 'app/modules/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ProfileController());
  
  // Get.put<MyDrawerController>(MyDrawerController());

  // Get.put(QrScannerController()); //! QrScannerController was not working fine frome here it was calling the controller but when user went back and come again controller stopped ; so It has done to be called from QrScannerView() with Get.put()...

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: Themes.lighttheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// class MyDrawerController extends GetxController {
//   final zoomDrawerController = ZoomDrawerController();

//   int setScreen = 0;

//   void toggleDrawer({required int screenNum}) {
//     print("Toggle drawer");
//     print(screenNum);
//     setScreen = screenNum;
//     update();
//     zoomDrawerController.toggle?.call();
//   }
// }
