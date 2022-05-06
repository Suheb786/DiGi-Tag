import 'dart:developer';
import 'dart:io';


import 'package:digitag/app/modules/widgets/custom_appbar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/medical_Support_Icon.dart';
import '../../widgets/slidableContainerDecoration.dart';
import '../../widgets/sliderPin.dart';
import 'medialsupport_controller.dart';

class MedicalSupportView extends GetView<MedicalsupportController> {
  // MedialsupportController controller = Get.put(MedialsupportController());
  XFile? imagepath;
  final ImagePicker _picker = ImagePicker();
  XFile? genreralImageOptional;
  XFile? genralImageRequired;

  MedicalSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size resposive = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Decorations.grdntBG,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                CustomAppBar(
                    deviceWidth: MediaQuery.of(context).size.width,
                    title: "Mediacal Alert",
                    widget: MedicalSupportIcon(),
                    appbarHeight: 150,
                    ctx: context)
              ];
            },
            body: SafeArea(
                child: Container(
              decoration: SlidableDecoration(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: SliderPin(),
                  ),
                  if (!isKeyboard)
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: resposive.width - 30,
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color:const Color(0xffCDCDCD), width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Push Medical Alert Notification ?",
                                style: TextStyle(
                                    color: Color(0xff48AE96),
                                    fontFamily: "SofiaPro",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25, top: 8),
                              child: Text(
                                "Are you in need of medical assistance? If so, a notification will be sent to all Digi-Tag users with your location When you click send medical support. ",
                                style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontFamily: "SofiaPro",
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isKeyboard)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Divider(
                        color: Color(0xffE6E6E6),
                        thickness: 2,
                      ),
                    ),
                  if (!isKeyboard)
                    Container(
                      height: 105,
                      width: resposive.width - 30,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xCCFFD7D0),
                                Color(0xE6FBAC9F),
                              ],
                              end: Alignment.bottomRight,
                              begin: Alignment.topLeft),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x1A000000),
                                offset: (Offset(0, 4)),
                                blurRadius: 25),
                          ]),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  "Emergency Alert",
                                  style: TextStyle(
                                      color: Color(0xffFF4141),
                                      fontFamily: "SofiaPro",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(
                                    left: 25.0, top: 8, right: 20),
                                child: SizedBox(
                                  width: resposive.width * 0.60,
                                  child: const Text(
                                    "Emergency Alert does not ask any details Only a picture of an actually condition is required for an emergency alert to be sent immediately. ",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5B),
                                      fontFamily: "SofiaPro",
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                // onTap: () async {
                                //   // Pick an image
                                //   imagepath = await _picker.pickImage(
                                //       source: ImageSource.gallery);
                                //   print(File(imagepath!.path));
                                // },
                                onTap: () =>
                                    controller.openEmergencyCamera(context),
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: const Color(0xff8c8c8c),
                                          width: 2)),

                                  child: GetBuilder<MedicalsupportController>(
                                    builder: (controller) {
                                      if (controller.pickedImage == null) {
                                        return const Icon(
                                          Icons.add_photo_alternate_rounded,
                                          size: 35,
                                          color: Color(0xff6E819F),
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.file(
                                            controller.pickedImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  // child: Padding(
                                  //   padding: EdgeInsets.all(3.0),
                                  //   child: imagepath == null
                                  //       ? Icon(
                                  //           Icons.add_photo_alternate_rounded,
                                  //           size: 35,
                                  //           color: Color(0xff6E819F),
                                  //         )
                                  //       : GestureDetector(
                                  //           onTap: () {
                                  //             Container(
                                  //               child: PhotoView(
                                  //                 imageProvider: AssetImage(
                                  //                     imagepath!.path),
                                  //               ),
                                  //             );
                                  //             print("fdf");
                                  //           },
                                  //           child: Image.file(
                                  //             File(imagepath!.path),
                                  //             height: 30,
                                  //             width: 30,
                                  //           ),
                                  //         ),
                                  // ),
                                ),
                              ),
                              sendButton(
                                  color: const Color(0xffFF6A6A),
                                  horizontalPadding: 15),
                            ],
                          ),
                        const   SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                      child: Container(
                        width: resposive.width - 30,
                        height: resposive.height * 0.35,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color:const Color(0xff48AE96), width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding:const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'General Alert',
                                      style: TextStyle(
                                          color: Color(0xff48AE96),
                                          fontFamily: "SofiaPro",
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    width: resposive.width - 150,
                                    child: medicalFormField(
                                        hintText: "Title :",
                                        validatior: (value) =>
                                            controller.titleValidation(value!)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SizedBox(
                                      width: resposive.width - 50,
                                      child: medicalFormField(
                                          validatior: (value) => controller
                                              .titleValidation(value!),
                                          maxLines: 6,
                                          hintText: "Massage :"),
                                    ),
                                  ),
                                ],
                              ),
                              if (isKeyboard)
                                SizedBox(
                                  height: resposive.height * 0.08,
                                ),
                              Row(
                                children: [
                                  genralImagerequired(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: generalImageOptional(),
                                  ),
                                  SizedBox(
                                    width: resposive.width / 5,
                                  ),
                                  const Spacer(),
                                  sendButton(
                                      color: const Color(0xff48AE96),
                                      horizontalPadding: 30,
                                      verticalPadding: 10),
                                ],
                              ),
                              if (isKeyboard) const Spacer()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ));
  }

  InkWell sendButton(
      {Function()? onTap,
      required Color color,
      double horizontalPadding = 12,
      double verticalPadding = 8}) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: const Text(
            "Send",
            style: TextStyle(color: Colors.white, fontFamily: "SofiaPro"),
          ),
        ),
      ),
    );
  }

  Widget generalImageOptional() {
    return InkWell(
      onTap: () {
        // Pick an image
        controller.openGeneralCamera();
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color:const Color(0xfff8C8C8C), width: 1)),
          child: GetBuilder<MedicalsupportController>(
            builder: (controller) {
              if (controller.pickGeneralImage == null) {
                return const Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 40,
                  color: Color(0xff6E819F),
                );
              } else {}
              return Padding(
                padding:const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: () {
                    PhotoView(
                      imageProvider: AssetImage(genreralImageOptional!.path),
                    );
                    log("fdf");
                  },
                  child: Image.file(
                    File(genreralImageOptional!.path),
                    fit: BoxFit.cover,
                    height: 35,
                    width: 35,
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget genralImagerequired() {
    return InkWell(
      onTap: () async {
        controller.openGeneralCamera();
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color:const Color(0xfff8C8C8C), width: 1)),
          child: GetBuilder<MedicalsupportController>(
            builder: (controller) {
              if (controller.pickGeneralImage == null) {
                return const Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 40,
                  color: Color(0xff6E819F),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    controller.pickGeneralImage!,
                    fit: BoxFit.fill,
                  ),
                );
              }
            },
          )),
    );
  }

  TextFormField medicalFormField(
      {required String? Function(String?) validatior,
      int? maxLines,
      String? hintText,
      TextEditingController? ctrllr}) {
    return TextFormField(
      maxLines: maxLines,
      controller: ctrllr,
      validator: validatior,
      style: const TextStyle(
          fontSize: 14, color: Color(0xff616161), fontFamily: "SofiaPro"),
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffC5C5C5),
            )),
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffC5C5C5),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffC5C5C5),
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
