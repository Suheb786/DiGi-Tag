import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_controller.dart';
import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';
import 'package:digitag/app/modules/widgets/feedback.dart';
import 'package:digitag/app/modules/widgets/custom_text_form_field.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:digitag/app/modules/widgets/medical_form_fields.dart';
import 'package:digitag/app/modules/widgets/textfield.dart';
import 'package:digitag/app/services/database_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/audit_card_model.dart';
import 'audit_card.dart';

class AuditOnWidget extends StatelessWidget {
  DatabaseServiceController findDBcontroller =
      Get.find<DatabaseServiceController>();
  MedicalsupportController findMedController =
      Get.find<MedicalsupportController>();

  List feedbackList = ["1", "2"];
  AuditOnWidget({Key? key}) : super(key: key);

  // final List auditCardList = [
  //   const AuditCard(
  //     branch: "CSE",
  //     facultyName: "Abhimanue Mishra",
  //     message: "Good work keep it up",
  //     userImageUrl: "assets/images/demopic.png",
  //     voting: Voting.up,
  //   ),
  //   const AuditCard(
  //       branch: "ME",
  //       facultyName: "Akhil Mishra",
  //       message: "Quick brown fox jump",
  //       userImageUrl: "assets/images/demopic.png",
  //       voting: Voting.down),
  //   const AuditCard(
  //     branch: "CSE",
  //     facultyName: "Abhimanue Mishra",
  //     message: "Good work keep it up",
  //     userImageUrl: "assets/images/demopic.png",
  //     voting: Voting.up,
  //   ),
  //   const AuditCard(
  //       branch: "ME",
  //       facultyName: "Akhil Mishra",
  //       message: "Quick brown fox jump",
  //       userImageUrl: "assets/images/demopic.png",
  //       voting: Voting.down),
  //   const AuditCard(
  //     branch: "CSE",
  //     facultyName: "Abhimanue Mishra",
  //     message: "Good work keep it up",
  //     userImageUrl: "assets/images/demopic.png",
  //     voting: Voting.up,
  //   ),
  //   const AuditCard(
  //       branch: "ME",
  //       facultyName: "Akhil Mishra",
  //       message: "Quick brown fox jump",
  //       userImageUrl: "assets/images/demopic.png",
  //       voting: Voting.down),
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Obx(() {
              if (Get.find<ProfileController>().showFeedbackField.value) {
                return FeedbackField(context);
              } else {
                return AddFeedback(context);
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.134 *
                  (profileController.userfeedback.length).toDouble(),
              child: GetBuilder<ProfileController>(
                init: ProfileController(),
                initState: (_) {},
                builder: (_) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileController.userfeedback.length,
                      itemBuilder: (_, index) => AuditCardWidget(
                            facultyName: "Mohammad",
                            //message: "",
                            message: profileController.userfeedback
                                .elementAt(index)
                                .get('feedback'),
                            userImageUrl: "kjh",
                            branch: "cse",
                            voting: profileController.userfeedback
                                .elementAt(index)
                                .get("like_dislike")
                                .toString(),
                            // voting: profileController.userfeedback!["like_dislike"]),
                          ));
                },
              ),
            ),
          ],
        ),
      ),
    );
    // return Column(
    //   children: [
    //     Obx(() {
    //       if (Get.find<ProfileController>().showFeedbackField.value) {
    //         return FeedbackField(context);
    //       } else {
    //         return AddFeedback(context);
    //       }
    //     }),
    //     // FeedbackField(),
    //     // AddFeedback(context),
    //     Column(
    //         children: auditCardList.map((e) {
    //       return AuditCardWidget(
    //           facultyName: e.facultyName,
    //           message: e.message,
    //           userImageUrl: e.userImageUrl,
    //           branch: e.branch,
    //           voting: e.voting);
    //     }).toList()),
    //   ],
    // );
  }
}
