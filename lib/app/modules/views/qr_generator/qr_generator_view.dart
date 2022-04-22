import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/controllers/qr_generator_controller.dart';
import 'package:digitag/app/modules/views/qr_generator/qr_generator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/audit_toggle_button.dart';
import '../../widgets/custom_appbar.dart';
import '../profile/audit_off_widget.dart';
import '../profile/audit_on_widget.dart';

class QrGeneratorView extends GetView<QrGeneratorController> {
  const QrGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.find<ProfileController>().onBack(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                CustomAppBar(
                  title: "Hi, Mohammad",
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
                      value: Get.find<ProfileController>().status.value,
                      onToggle: (val) {
                        Get.find<ProfileController>().audioSwitchCheck();
                      },
                    ),
                  ),
                  Expanded(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();

                        return false;
                      },
                      child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverFillRemaining(
                            // fillOverscroll: true,
                            hasScrollBody: false,
                            child: Obx(
                              () => Get.find<ProfileController>().status.value
                                  ? AuditOnWidget()
                                  : QrGeneratorWidget(),
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
