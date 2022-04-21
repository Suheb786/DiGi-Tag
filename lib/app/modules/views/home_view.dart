import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/appbar.dart';
import '../widgets/decoration.dart';
import '../widgets/icon_Stack.dart';
import '../widgets/medical_Support_Icon.dart';
import '../widgets/profile_Stack.dart';
import 'profile/audit_on_widget.dart';

class HomeView extends GetView<HomeController> {
  ProfileController profilecontroller = Get.find<ProfileController>();
  DateTime? currentBackPressTime;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();

        if (profilecontroller.status.value == true) {
          profilecontroller.status.value = false;
          return Future.value(false);
        } else if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 3)) {
          currentBackPressTime = now;

          Fluttertoast.showToast(
              gravity: ToastGravity.BOTTOM_RIGHT,
              msg: 'Back again now to Exit DiGi-Tag App',
              backgroundColor: Colors.white,
              textColor: Colors.black87);
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: Scaffold(
        appBar: MyAppBar(MediaQuery.of(context).size.width, 0,
            ctx: context, onHomeView: true),
        backgroundColor: const Color(0xff50e6da),
        body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if ((details.primaryDelta! > 0.0)) {
              ZoomDrawer.of(context)!.open();
            } else if (details.primaryDelta! < 10.0) {
              ZoomDrawer.of(context)!.close();
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: Decorations.grdntBG,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: responsive.height / 40,
                    ),
                    // CustomUserNameIcons(),
                    const Spacer(),
                    const MedicalSupportIcon(),
                    const Spacer(),
                    ProfileStack(),
                    const SizedBox(
                      height: 23,
                    ),
                    Obx(() => FlutterSwitch(
                          value: profilecontroller.status.value,
                          padding: 2,
                          onToggle: (val) {
                            if (profilecontroller.status.value == false) {
                              profilecontroller.status.value = true;
                            } else {
                              profilecontroller.status.value = false;
                            }
                          },
                          valueFontSize: 9,
                          showOnOff: true,
                          inactiveText: "Audit On",
                          activeText: "OFF",
                          width: 75,
                          height: 27,
                          inactiveColor: const Color(0x80004E79),
                          activeColor: const Color(0x80004E79),
                          inactiveToggleColor: const Color(0x9942FFDD),
                          inactiveToggleBorder: Border.all(
                              width: 1, color: const Color(0x663347B4)),
                        )),
                    const SizedBox(
                      height: 300,
                    ),
                    Obx((() => profilecontroller.status.value
                        ? Expanded(child: AuditOnWidget())
                        : IconStack())),
                    const SizedBox(
                      height: 65,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
