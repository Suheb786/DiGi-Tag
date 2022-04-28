import 'package:digitag/app/modules/screens/Form/form_controller.dart';

import 'package:digitag/app/modules/screens/Home/home_controller.dart';
import 'package:digitag/app/modules/screens/Login/login_controller.dart';
import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/Theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(AuthController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ProfileController());
  Get.put(FormController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: Themes.lighttheme,
      initialRoute: Routes.FORM,
      getPages: AppPages.routes,
      // home: const LoadingOnAuthStateCheck(),
    ),
  );
}
