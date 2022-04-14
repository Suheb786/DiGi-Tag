import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/Theme/theme.dart';
import 'app/modules/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';

// saffer working fine
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoginController());
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: Themes.lighttheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
