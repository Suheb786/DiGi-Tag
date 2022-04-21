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
