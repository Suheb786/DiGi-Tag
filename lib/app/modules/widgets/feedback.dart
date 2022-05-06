import 'dart:developer';

import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';
import 'package:digitag/app/modules/widgets/custom_text_form_field.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

ProfileController profileController = Get.find<ProfileController>();
Padding AddFeedback(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
        width: MediaQuery.of(context).size.width - 20,
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
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-3, -2),
                      blurRadius: 4,
                      color: Color(0x40FFFFFF)),
                  BoxShadow(
                      offset: Offset(1, 3),
                      blurRadius: 4,
                      color: Color(0x40B7B7B7))
                ]),
            child: Icon(
              Icons.add_rounded,
              size: 50,
              color: Color(0xffE6E6E6),
            ),
          ),
        ),
      ),
    ),
  );
}

Padding FeedbackField() {
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
                    if (profileController.feedbackFormKey.currentState!
                        .validate()) {
                      print("saved Now send this to database");
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
