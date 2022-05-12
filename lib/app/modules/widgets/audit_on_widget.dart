import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/modules/screens/Form/form_controller.dart';
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
import 'package:google_fonts/google_fonts.dart';

import '../../models/audit_card_model.dart';
import 'audit_card.dart';

class AuditOnWidget extends StatelessWidget {
  DatabaseServiceController findDBcontroller =
      Get.find<DatabaseServiceController>();
  MedicalsupportController findMedController =
      Get.find<MedicalsupportController>();

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
          stream: profileController.auditstream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData
                ? SingleChildScrollView(
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
                                0.1399 *
                                snapshot.data.docs.length,
                            // (profileController.userfeedback!.docs.length)
                            //     .toDouble(),

                            // snapshot.data.docs.length,
                            // MediaQuery.of(context).size.height *
                            //     0.134 *
                            //     (profileController.userfeedback.length).toDouble(),
                            child: AuditList(snapshot, context),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white70,
                  ));
          }),
    );
  }

  Widget AuditList(AsyncSnapshot<dynamic> snapshot, BuildContext context) {
    if (snapshot.hasError) {
      return Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: const Text('Connection Lost from DataBase'),
      );
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    // if (!snapshot.hasData) {
    //   return CircularProgressIndicator();
    // }

    return (snapshot.data.docs.length > 0)
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            // itemCount: profileController.userfeedback!.docs.length,
            itemBuilder: (_, index) {
              DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
              return AuditCardWidget(
                  facultyName: "Mohammad",
                  //message: "",
                  message: profileController.userfeedback != null
                      ? documentSnapshot["feedback"]
                      : '- - -',
                  userImageUrl: "kjh",
                  branch: "cse",
                  voting: documentSnapshot["like_dislike"]
                  // "${profileController.userfeedback!.docs.elementAt(index).get('like_dislike')}",
                  );
            })
        : const Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
                child: Icon(
              Icons.error_rounded,
              size: 100,
              color: Colors.white24,
            )),
          );
  }
}
