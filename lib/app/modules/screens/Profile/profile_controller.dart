import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:digitag/app/services/auth_service_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/database_service_controller.dart';

class ProfileController extends GetxController {
  TextEditingController comment = TextEditingController();
  final feedbackFormKey = GlobalKey<FormState>();

  var reload = false.obs;
  var status = false.obs;
  var wrapPadding = 50.0.obs;
  var spacing = 5.0.obs;
  var showFeedbackField = false.obs;
  // var liked = false.obs;

  // var disliked = false.obs;
  var voting = Voting.up.obs;
  ScrollController profileScrollController = ScrollController();
  var scrollOffset = 0.0.obs;

  Map<String, dynamic>? userData = {};
  QuerySnapshot? userfeedback;

  void toggleLikeDislikeButton(Voting vote) {
    log('Toggle like dislike called');
    voting.value = vote;
    // if (voting.value == Voting.up) {
    //   voting.value = Voting.down;
    // } else {
    //   voting.value = Voting.up;
    // }
    // log(voting.value.toString());
  }

  callingAudit() async {
    log("onInitworking");
    userData = await Get.find<DatabaseServiceController>()
        .getProfile(uid: "mI1ejboWToUzc1XJ4KSc");

    userfeedback = await Get.find<DatabaseServiceController>().getAudit();
    print("Profile controller userFeedBack data ${userfeedback!.docs}");
  }

  @override
  void onInit() {
    callingAudit();
    super.onInit();

    // profileScrollController.addListener(() => updatePadding());
  }

  Stream<dynamic> auditstream = FirebaseFirestore.instance
      .collection('audits')
      .orderBy("postedAt", descending: true)
      .snapshots();
  void updatePadding() {
    // print(profileScrollController.offset);

    var offSet = profileScrollController.offset;
    // if (profileScrollController.offset > 100) {
    //   wrapPadding.value = 70;
    // } else if (profileScrollController.offset > 150) {
    //   wrapPadding.value = 90;
    // }
    if (offSet >= 0 && offSet <= 50) {
      wrapPadding.value = 50;
      spacing.value = 5;
    } else if (offSet >= 51 && offSet <= 100) {
      wrapPadding.value = 70;
      spacing.value = 10;
    } else if (offSet >= 101 && offSet <= 120) {
      wrapPadding.value = 100;
      spacing.value = 15;
    } else {}
  }

//* FeedBack validation

  commentValidation(comment) {
    if (comment.toString().isEmpty) {
      return "";
    }
  }

  Future<bool> onBack() async {
    showFeedbackField.value = false;

    if (status.value) {
      status.value = false;
      return false;
    } else {
      Get.offAllNamed(Routes.DRAWER);
      // ZoomDrawer.of(context)!.close();
      status.value = false;
      showFeedbackField.value = false;

      return false;
    }
  }

  late DateTime postedAt;

  postComment() async {
    Map<String, dynamic> addComment = {
      "feedback": comment.text,
      "like_dislike": voting.value.toString(),
      "postedAt": DateTime.now().millisecondsSinceEpoch
    };
    postedAt = DateTime.fromMillisecondsSinceEpoch(addComment['postedAt']);
    Get.find<DatabaseServiceController>().addAudit(addComment);
    //userfeedback = await Get.find<DatabaseServiceController>().getAudit();
  }

  void audioSwitchCheck() {
    if (status.value == false) {
      status.value = true;
    } else {
      status.value = false;
    }
    update();
  }

  final count = 0.obs;
  @override
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
