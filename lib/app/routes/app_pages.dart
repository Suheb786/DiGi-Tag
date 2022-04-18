

import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../modules/bindings/drawer_binding.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/bindings/login_binding.dart';
import '../modules/bindings/profile_binding.dart';
import '../modules/bindings/otp_view_binding.dart';
import '../modules/views/otp_view_view.dart';
import '../modules/views/drawer_view.dart';
import '../modules/views/home_view.dart';
import '../modules/views/login_view.dart';
import '../modules/views/profile/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.OTP_VIEW;

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
  ];
}
