import 'dart:io';

import 'package:digitag/app/modules/screens/Form/form_controller/academicDetails_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/form_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/medicalDetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsController extends GetxController {
  final personalFormKey = GlobalKey<FormState>();

  FormController formController = Get.find<FormController>();
  MedicalDetailsController medicalDetailsController =
      Get.find<MedicalDetailsController>();
  AcademicDetailsController academicDetailsController =
      Get.find<AcademicDetailsController>();

  //* Variables >>>>>>>>>

  DateTime? dob; // Null if value is not picked
  File? pickedImage; // Null if image is not pucked

  //*RegExpressions // --------------->>>>>>>>
  RegExp nameRex =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  //* Personal Details Form Validation methods ------------------->>>>>>>
  String? emailvalidation(email) {
    if (email!.isEmpty || email == null) {
      return "Email Field cann't be Empty";
    } else if (!emailRex.hasMatch(email)) {
      return "Enter a valid Email";
    }
    return null;
  }

  String? fullnameValidation(name) {
    if (name!.isEmpty || name == null)
      return "Please Your Name ";
    else if (!nameRex.hasMatch(name)) {
      return "Please Enter Your Full name";
    }
  }

  String? dobValidation(dob) {
    if (dob!.isEmpty || dob == null) return "Select Your Date of Birth";
  }

  String? addressValidation(address) {
    if (address!.isEmpty || address == null)
      return "Please Enter Your Home Adsress";
  }
  //*Form Check---------->>>>>>>

  bool checkPersonalDetails() {
    if (personalFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  //* Pic image from camera >>>>>>>>>>>>
  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    Get.back();
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    update();
  }

  //* DOB datePicker handler >>>>>>>>>>>
  void dobDatePicker({required BuildContext context}) async {
    dob = await showDatePicker(
      builder: ((context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            colorScheme: ColorScheme.light(
                primary: Colors.cyan.shade200,
                onPrimary: Colors.white, // header text color
                onSurface: const Color(0xffB2C2ED) // body text color
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: const Color(0xff779FE5), // button text color
              ),
            ),
          ),
          child: child!,
        );
      }),
      context: context,
      initialDate: DateTime.utc(1997),
      firstDate: DateTime.utc(1940),
      lastDate: DateTime.utc(2005),
      helpText: "Select your date of birth",
    );

    var pickedDateString = dob.toString().split(" ");

    if (dob != null) {
      formController.dobController.text = pickedDateString[0];
    } else {
      formController.dobController.text = "";
    }
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //* Pic image from gallery >>>>>>>>>>>>
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    Get.back();
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    update();
  }

  //* Image picker Alert Dialog >>>>>>>>>
  Future<void> picImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: const Text(
              "Choose option",
              style: TextStyle(
                color: Color(0xff779FE5),
                fontFamily: "SofiaPro",
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Color(0xff779FE5),
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff779FE5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text(
                      "Camera",
                      style: TextStyle(
                        color: Color(0xff779FE5),
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff779FE5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
