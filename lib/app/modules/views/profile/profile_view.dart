import 'package:digitag/app/modules/widgets/custom_appbar.dart';

import 'package:digitag/app/modules/views/drawer_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../../Decoration/text/text.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/audit_toggle_button.dart';
import '../../widgets/profile_Stack.dart';
import 'audit_off_widget.dart';
import 'audit_on_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    controller.profileScrollController.addListener(
      () {
        controller.scrollOffset.value =
            controller.profileScrollController.offset;
      },
    );
    return WillPopScope(
      onWillPop: () => controller.onBack(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: NestedScrollView(
            controller: controller.profileScrollController,
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                CustomAppBar(
                  deviceWidth: MediaQuery.of(context).size.width,
                  ctx: context,
                ),
              ];
            },
            body: SafeArea(
              child: Column(
                children: [
                  
                  Obx(
                    () => AuditToggleButton(
                      value: controller.status.value,
                      onToggle: (val) {
                        controller.audioSwitchCheck();
                      },
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
                        

                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverFillRemaining(
                            // fillOverscroll: true,
                            hasScrollBody: false,
                            child: Obx(
                              () => controller.status.value
                                  ? AuditOnWidget()
                                  : AuditOffWidget(),
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
    );
  }
}
