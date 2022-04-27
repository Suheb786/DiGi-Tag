import 'package:flutter/material.dart';

import '../../enums/voting.dart';
import '../../models/audit_card_model.dart';
import 'audit_card.dart';


class AuditOnWidget extends StatelessWidget {
  // ProfileController profileController = Get.put(ProfileController());
  // ProfileController profileController = Get.find<ProfileController>();
  AuditOnWidget({Key? key}) : super(key: key);

  final List<AuditCard> auditCardList = [
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
