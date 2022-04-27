import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/Theme/theme.dart';

import 'app/modules/views/Home/home_controller.dart';
import 'app/modules/views/Login/login_controller.dart';
import 'app/modules/views/Profile/profile_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(AuthController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ProfileController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: Themes.lighttheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: const LoadingOnAuthStateCheck(),
    ),
  );
}
