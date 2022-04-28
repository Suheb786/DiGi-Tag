import 'package:digitag/app/modules/screens/Drawer/drawer_binding.dart';
import 'package:digitag/app/modules/screens/Drawer/drawer_view.dart';
import 'package:digitag/app/modules/screens/Form/form_binding.dart';
import 'package:digitag/app/modules/screens/Form/form_view.dart';
import 'package:digitag/app/modules/screens/Home/home_binding.dart';
import 'package:digitag/app/modules/screens/Home/home_view.dart';
import 'package:digitag/app/modules/screens/Login/login_binding.dart';
import 'package:digitag/app/modules/screens/Login/login_view.dart';
import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_binding.dart';
import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_view.dart';
import 'package:digitag/app/modules/screens/Notification/notification_binding.dart';
import 'package:digitag/app/modules/screens/Notification/notification_view.dart';
import 'package:digitag/app/modules/screens/OTP/otp_view_binding.dart';
import 'package:digitag/app/modules/screens/OTP/otp_view_view.dart';
import 'package:digitag/app/modules/screens/Profile/profile_binding.dart';
import 'package:digitag/app/modules/screens/Profile/profile_view.dart';
import 'package:digitag/app/modules/screens/QrGenerator/qr_generator_binding.dart';
import 'package:digitag/app/modules/screens/QrGenerator/qr_generator_view.dart';
import 'package:digitag/app/modules/screens/QrScanner/qr_scanner.dart';
import 'package:digitag/app/modules/screens/QrScanner/qr_scanner_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DRAWER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VIEW,
      page: () => OtpViewView(),
      binding: OtpViewBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCANNER,
      page: () => QrScannerView(),
      binding: QrScannerBinding(),
    ),
    GetPage(
      name: _Paths.QR_GENERATOR,
      page: () => QrGeneratorView(),
      binding: QrGeneratorBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => FormView(),
      binding: FormBinding(),
    ),
    GetPage(
      name: _Paths.MEDIALSUPPORT,
      page: () => MedicalSupportView(),
      binding: MedialsupportBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
