import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/Profile/profile_controller.dart';
import 'profile_details_card.dart';
import 'socialMediaButton.dart';

class AuditOffWidget extends StatelessWidget {
  ProfileController profileController = Get.find<ProfileController>();
  AuditOffWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 0,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white54),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileDetailsCard(
                        assetImagePath:
                            "assets/icons/profile_icons/courseIcon.jpg",
                        shadowColor: Color(0xffFF4FF8),
                        mainTitleColor: Color(0xffD25099),
                        mainTitle: "Course",
                        middleTitle:
                            "${profileController.userData!["course"]} ${profileController.userData!["semester"]}",
                        bottomTitle: profileController.userData!['branch'],
                      ),
                      ProfileDetailsCard(
                        assetImagePath:
                            "assets/icons/profile_icons/rollnoIcon.jpg",
                        shadowColor: Color(0xffFFB274),
                        mainTitleColor: Color(0xffF28412),
                        mainTitle: "Roll no.",
                        middleTitle: profileController.userData!['roll_no'],
                        bottomTitle: "E.No : 185451049580",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileDetailsCard(
                        assetImagePath:
                            "assets/icons/profile_icons/contactIcon.jpg",
                        shadowColor: Color(0xffFC8787),
                        mainTitleColor: Color(0xffE93434),
                        mainTitle: "Contact",
                        middleTitle: profileController.userData!['email'],
                        bottomTitle: profileController.userData!['phoneNo'],
                        // bottomTitle: Get.find<AuthServiceController>()
                        //     .getPhoneNumber
                        //     .toString(),
                        //  bottomTitle: "8381824339" //Todo add phone no,
                      ),
                      ProfileDetailsCard(
                        assetImagePath:
                            "assets/icons/profile_icons/medicalIcon.jpg",
                        shadowColor: Color(0xff51FF77),
                        mainTitleColor: Color(0xff52BB13),
                        mainTitle: "Medical",
                        middleTitle:
                            "Blood Group ${profileController.userData!['blood_group']}",
                        bottomTitle: profileController.userData!["vacination"],
                      ),
                    ],
                  ),
                  ProfileDetailsCard(
                      assetImagePath:
                          "assets/icons/profile_icons/addressIcon.jpg",
                      shadowColor: Color(0xff93FFA4),
                      mainTitleColor: Color(0xff29BC9E),
                      mainTitle: "Address",
                      middleTitle: profileController.userData!['city'],
                      bottomTitle: profileController.userData!["address"]),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => Container(
                  // height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          Get.find<ProfileController>().wrapPadding.value,
                      vertical: 13),
                  // color: Colors.amber,
                  child: Wrap(
                    spacing: Get.find<ProfileController>().spacing.value,
                    runSpacing: Get.find<ProfileController>().spacing.value,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 4,
                    //   mainAxisSpacing: 5,
                    //   crossAxisSpacing: 5,
                    // ),
                    children: const [
                      SocialMediaButton(url: "assets/icons/social/FB icon.jpg"),
                      SocialMediaButton(
                          url: "assets/icons/social/Insta icon.jpg"),
                      SocialMediaButton(
                          url: "assets/icons/social/snapchat icon.jpg"),
                      SocialMediaButton(
                          url: "assets/icons/social/plusIcon.jpg"),
                    ],
                  ),
                  // child: GridView(

                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 3,
                  //     childAspectRatio: 4 / 4,

                  //   ),
                  //   children: [
                  //     SocialMediaButton(),
                  //     SocialMediaButton(),
                  //     SocialMediaButton(),
                  //     SocialMediaButton(),
                  //   ],
                  // ),
                  // TODO: social media buttions impl.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





              



          //     CustomScrollView(
          //   // physics: const ClampingScrollPhysics(),
          //   slivers: [
          //     SliverFillRemaining(
          //       hasScrollBody: false,
          //       child: ),
          //   ],
          // ),