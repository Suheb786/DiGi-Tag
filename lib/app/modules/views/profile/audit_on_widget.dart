import 'package:flutter/material.dart';

import '../../widgets/audit_card.dart';

class AuditOnWidget extends StatelessWidget {
  const AuditOnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuditCard(),
        AuditCard(),
        AuditCard(),
        AuditCard(),
        AuditCard(),
        AuditCard(),
      ],
    );
  }
}
