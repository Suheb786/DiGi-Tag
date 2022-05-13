import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/audit_on_widget.dart';
import '../../widgets/audit_toggle_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/icon_Stack.dart';
import '../Profile/profile_controller.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  ProfileController profilecontroller = Get.find<ProfileController>();
  DateTime? currentBackPressTime;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final responsive = MediaQuery.of(context).size;
    return WillPopScope(
      //? Toast on exit.
      onWillPop: () {
        DateTime now = DateTime.now();

        // Get.find<ProfileController>().onBack();

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
        backgroundColor: const Color(0xff50e6da),
        body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if ((details.primaryDelta! > 0.0)) {
              ZoomDrawer.of(context)!.open();
            } else if (details.primaryDelta! < 10.0) {
              ZoomDrawer.of(context)!.close();
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Decorations.grdntBG,
            child: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              // controller: Get.find<ProfileController>().profileScrollController,
              headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                return [
                  CustomAppBar(
                    title:
                        "Hi, ${Get.find<ProfileController>().userData!["full_name"].toString().split(" ")[0]}",
                    deviceWidth: MediaQuery.of(context).size.width,
                    ctx: context,
                    onHomeView: true,
                  ),
                ];
              },
              body: SafeArea(
                child: Column(
                  children: [
                    Obx(
                      () => Visibility(
                        visible: Get.find<ProfileController>().status.value,
                        child: AuditToggleButton(
                          value: Get.find<ProfileController>().status.value,
                          onToggle: (val) {
                            Get.find<ProfileController>().audioSwitchCheck();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overScroll) {
                          overScroll.disallowIndicator();
                          // print();
                          return false;
                        },
                        child: CustomScrollView(
                          // controller: controller.homeScrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          slivers: [
                            SliverFillRemaining(
                              // fillOverscroll: true,
                              hasScrollBody: false,
                              child: Form(
                                // key: Get.find<ProfileController>()
                                //     .feedbackFormKey,
                                child: Obx(
                                  () => Get.find<ProfileController>()
                                          .status
                                          .value
                                      ? AuditOnWidget()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 90),
                                          child: IconStack(),
                                        ), //!Expanded issue here
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
