import 'package:digitag/app/Decoration/enums/voting.dart';
import 'package:digitag/app/models/audit_card_model.dart';

import 'package:digitag/app/modules/controllers/profile_controller.dart';
import 'package:digitag/app/modules/views/profile/audit_off_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../widgets/audit_card.dart';
import '../drawer_view.dart';

class AuditOnWidget extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  // ProfileController profileController = Get.find<ProfileController>();
  AuditOnWidget({Key? key}) : super(key: key);

  List<AuditCard> auditCardList = [
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
    return Column(
        children: auditCardList.map((e) {
      return AuditCardWidget(
          facultyName: e.facultyName,
          message: e.message,
          userImageUrl: e.userImageUrl,
          branch: e.branch,
          voting: e.voting);
    }).toList());
  }
}
