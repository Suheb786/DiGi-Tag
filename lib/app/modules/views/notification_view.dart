import 'package:digitag/app/modules/widgets/slidableContainerDecoration.dart';
import 'package:digitag/app/modules/widgets/sliderPin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Decoration/decoration.dart';
import '../controllers/notification_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/notification_ListView_Widgets.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Decorations.grdntBG,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              CustomAppBar(
                  deviceWidth: MediaQuery.of(context).size.width,
                  title: "Notification",
                  appbarHeight: 80,
                  widget: SizedBox(height: 1),
                  ctx: context)
            ];
          },
          body: SafeArea(
            child: Container(
              decoration: SlidableDecoration(),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return false;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: SliderPin(),
                    ),
                    Expanded(child: listView(7)),
                    // Divider(
                    //   thickness: 2,
                    //   color: Color(0xffE6E6E6),
                    // ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 20.0),
                    //     child: oldListView(7),
                    //   ),
                    // )
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
