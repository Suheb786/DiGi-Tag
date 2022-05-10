import 'package:cloud_firestore/cloud_firestore.dart';
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
  Stream<dynamic> auditstream = FirebaseFirestore.instance
      .collection('audits')
      .snapshots()
      .asBroadcastStream();

  List feedbackList = [];
  AuditOnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        profileController.callingAudit();
        return false;
      },
      child: StreamBuilder<dynamic>(
          stream: auditstream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print("snapshot data is:: ${snapshot.hasData}");
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Obx(() {
                      if (Get.find<ProfileController>()
                          .showFeedbackField
                          .value) {
                        return FeedbackField(context);
                      } else {
                        return AddFeedback(context);
                      }
                    }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.134 *
                          profileController.userfeedback!.docs.length,
                      // MediaQuery.of(context).size.height *
                      //     0.134 *
                      //     (profileController.userfeedback.length).toDouble(),
                      child: GetBuilder<ProfileController>(
                        init: ProfileController(),
                        initState: (_) {},
                        builder: (_) {
                          return Obx(() {
                            if (profileController.reload.value ||
                                profileController.status.value) {
                              return (profileController
                                          .userfeedback!.docs.length >
                                      0)
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: profileController
                                          .userfeedback!.docs.length,
                                      itemBuilder: (_, index) =>
                                          AuditCardWidget(
                                              facultyName: "Mohammad",
                                              //message: "",
                                              message: profileController
                                                          .userfeedback !=
                                                      null
                                                  ? "${profileController.userfeedback!.docs.elementAt(index).get('feedback')}"
                                                  : '- - -',
                                              userImageUrl: "kjh",
                                              branch: "cse",
                                              voting:
                                                  "${profileController.userfeedback!.docs.elementAt(index).get('like_dislike')}"))
                                  : Container();
                            }
                            return Text("data");
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
