import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/modules/screens/Form/form_controller.dart';
import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';
import 'package:digitag/app/modules/widgets/custom_text_form_field.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/database_service_controller.dart';

ProfileController profileController = Get.find<ProfileController>();

Widget AddFeedback(BuildContext? context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
    child: InkWell(
      onTap: (() {
        if (profileController.showFeedbackField.value) {
          profileController.showFeedbackField.value = false;
        } else {
          profileController.showFeedbackField.value = true;
        }
      }),
      child: Container(
        height: 110,
        width: MediaQuery.of(context!).size.width - 20,
        decoration: BoxDecoration(
          color: Color(0xBFFFFFFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 53,
            width: 53,
            decoration: const BoxDecoration(
                color: Color(0xffCADCF5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-5, -9),
                      blurRadius: 20,
                      color: Color(0xffF6FBFF)),
                  BoxShadow(
                      offset: Offset(4, 6),
                      blurRadius: 30,
                      color: Color(0x807292C0))
                ]),
            child: Icon(
              Icons.add_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget FeedbackField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
    child: Container(
      height: 110,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(
                color: Color(0xcc00000), offset: Offset(2, 6), blurRadius: 20)
          ],
          color: Color(0xBFFFFFFF),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 60),
              child: CustomTextformField(
                controller: profileController.comment,
                autoValid: AutovalidateMode.onUserInteraction,
                validator: (comment) =>
                    profileController.commentValidation(comment),
                maxLength: 100,
                maxLines: 3,
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (profileController.comment.text.length > 20) {
                      log("saved Now send this to database");
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(
                                "Publish comment",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87, fontSize: 13),
                              ),
                              content: Text(
                                "This comment will be visible to all user who visit ${profileController.userData!['full_name']} audit profile",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Edit",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.redAccent))),
                                TextButton(
                                  onPressed: () async {
                                    profileController.showFeedbackField.value =
                                        false;
                                    profileController.postComment();
                                    profileController.comment.text = "";
                                    Get.back();
                                    Get.find<FormController>()
                                        .showGreenSnackbar(
                                      snackPosition: SnackPosition.BOTTOM,
                                      massage:
                                          "Your comment is now visible to all",
                                      text: "Successfully added",
                                    );
                                  },
                                  child: Text("Post",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.blueAccent)),
                                ),
                              ],
                              backgroundColor: Color(0xffD2EAFF),
                            );
                          });
                    } else {
                      Get.find<FormController>().showRedSnackbar(
                          "Comment is too short",
                          "Your Feedback must be as long as it can describe your point of view");
                    }
                  },
                  child: Icon(
                    Icons.send_rounded,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return LikeButton();
                }),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return DislikeButton();
                })
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget LikeButton() {
  return InkWell(
    onTap: () => profileController.toggleLikeDislikeButton(Voting.up),
    child: profileController.voting == Voting.up
        ? Icon(
            Icons.thumb_up_rounded,
            color: Colors.blue,
            size: 25,
          )
        : Icon(
            Icons.thumb_up_rounded,
            color: Colors.blueGrey,
            size: 25,
          ),
  );
}

Widget DislikeButton() {
  return InkWell(
    onTap: () => profileController.toggleLikeDislikeButton(Voting.down),
    child: profileController.voting == Voting.down
        ? Icon(
            Icons.thumb_down_rounded,
            color: Colors.redAccent,
            size: 25,
          )
        : Icon(
            Icons.thumb_down_rounded,
            color: Colors.blueGrey,
            size: 25,
          ),
  );
}
