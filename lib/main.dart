import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/Theme/theme.dart';
import 'app/modules/screens/Form/form_controller.dart';
import 'app/modules/screens/Home/home_controller.dart';
import 'app/modules/screens/Login/login_controller.dart';
import 'app/modules/screens/Profile/profile_controller.dart';
import 'app/modules/widgets/loading_on_auth_state_check.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service_controller.dart';
import 'app/services/database_service_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthServiceController());
  Get.put(DatabaseServiceController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ProfileController());
  Get.put(FormController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: Themes.lighttheme,
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: const LoadingOnAuthStateCheck(),
    ),
  );
}
