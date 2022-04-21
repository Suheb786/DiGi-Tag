import 'package:digitag/app/Decoration/enums/voting.dart';
import 'package:flutter/material.dart';

import '../../widgets/audit_card.dart';

class AuditOnWidget extends StatelessWidget {
  const AuditOnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AuditCard(
          branch: "CSE",
          facultyName: "Abhimanue Mishra",
          message: "Good work keep it up",
          userImageUrl: "assets/images/demopic.png",
          voting: Voting.up,
        ),
      ],
    );
  }
}
