import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/Theme/theme.dart';
import 'app/modules/screens/Form/form_controller.dart';
import 'app/modules/screens/Home/home_controller.dart';
import 'app/modules/screens/Login/login_controller.dart';
import 'app/modules/screens/Profile/profile_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/services/Notifications/local_notification.dart';
import 'app/services/Notifications/pushNotification_controller.dart';
import 'app/services/database_service_controller.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("onBackgroundMessageHandler called");
  // LocalNotificationService.createanddisplaynotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(AuthServiceController());
  Get.put(PushNotificationController());
  Get.put(DatabaseServiceController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ProfileController());
  Get.put(FormController());
  Get.put(MedicalsupportController());
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  final token = await FirebaseMessaging.instance.getToken();
  print("Device ID is : $token"); //to print id Token

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
