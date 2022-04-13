import 'package:get/get.dart';

<<<<<<< HEAD
import '../modules/bindings/drawer_binding.dart';
import '../modules/views/drawer_view.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/views/home_view.dart';
import '../modules/bindings/login_binding.dart';
import '../modules/views/login_view.dart';
import '../modules/bindings/profile_binding.dart';
import '../modules/views/profile_view.dart';
=======
import '../modules/drawer/bindings/drawer_binding.dart';
import '../modules/drawer/views/drawer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
>>>>>>> edf43e46e477e26275465a8cb62e0cd2a5432f3e

part 'app_routes.dart';

class AppPages {
  AppPages._();

<<<<<<< HEAD
  static const INITIAL = Routes.DRAWER;
=======
  static const INITIAL = Routes.PROFILE;
>>>>>>> edf43e46e477e26275465a8cb62e0cd2a5432f3e

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
  ];
}
