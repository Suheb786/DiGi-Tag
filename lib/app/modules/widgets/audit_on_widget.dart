import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_controller.dart';
import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';
import 'package:digitag/app/modules/widgets/feedback.dart';
import 'package:digitag/app/modules/widgets/custom_text_form_field.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:digitag/app/modules/widgets/medical_form_fields.dart';
import 'package:digitag/app/modules/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/audit_card_model.dart';
import 'audit_card.dart';

class AuditOnWidget extends StatelessWidget {
  MedicalsupportController findMedController =
      Get.find<MedicalsupportController>();

  AuditOnWidget({Key? key}) : super(key: key);

  final List auditCardList = [
    const AuditCard(
      branch: "CSE",
      facultyName: "Abhimanue Mishra",
      message: "Good work keep it up",
      userImageUrl: "assets/images/demopic.png",
      voting: Voting.up,
    ),
    const AuditCard(
        branch: "ME",
        facultyName: "Akhil Mishra",
        message: "Quick brown fox jump",
        userImageUrl: "assets/images/demopic.png",
        voting: Voting.down),
    const AuditCard(
      branch: "CSE",
      facultyName: "Abhimanue Mishra",
      message: "Good work keep it up",
      userImageUrl: "assets/images/demopic.png",
      voting: Voting.up,
    ),
    const AuditCard(
        branch: "ME",
        facultyName: "Akhil Mishra",
        message: "Quick brown fox jump",
        userImageUrl: "assets/images/demopic.png",
        voting: Voting.down),
    const AuditCard(
      branch: "CSE",
      facultyName: "Abhimanue Mishra",
      message: "Good work keep it up",
      userImageUrl: "assets/images/demopic.png",
      voting: Voting.up,
    ),
    const AuditCard(
        branch: "ME",
        facultyName: "Akhil Mishra",
        message: "Quick brown fox jump",
        userImageUrl: "assets/images/demopic.png",
        voting: Voting.down),
  ];

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: auditCardList.length,
    //   itemBuilder: (_, index) => AuditCardWidget(
    //       facultyName: auditCardList[index].facultyName,
    //       message: auditCardList[index].message,
    //       userImageUrl: auditCardList[index].userImageUrl,
    //       branch: auditCardList[index].branch,
    //       voting: auditCardList[index].voting),
    // );
    return Form(
      key: Get.find<ProfileController>().feedbackFormKey,
      child: Column(
        children: [
          Obx(() {
            if (Get.find<ProfileController>().showFeedbackField.value) {
              return FeedbackField();
            } else {
              return AddFeedback(context);
            }
          }),
          // FeedbackField(),
          // AddFeedback(context),
          Column(
              children: auditCardList.map((e) {
            return AuditCardWidget(
                facultyName: e.facultyName,
                message: e.message,
                userImageUrl: e.userImageUrl,
                branch: e.branch,
                voting: e.voting);
          }).toList()),
        ],
      ),
    );
  }
}
