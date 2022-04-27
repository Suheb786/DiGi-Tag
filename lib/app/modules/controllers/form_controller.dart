import 'dart:io';

import 'package:flutter/material.dart';
import 'package:digitag/app/enums/form_buttons.dart';
import 'package:digitag/app/enums/student_type.dart';
import 'package:digitag/app/enums/vaccination.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/database_service_controller.dart';

class FormController extends GetxController {
  // Form controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController enrollmentNoController = TextEditingController();
  TextEditingController bloodGroupcontroller = TextEditingController();
  TextEditingController allergyController = TextEditingController();

  // Observable variables
  var activeButton = FormButton.personal.obs;
  var studentType = StudentType.hosteler.obs;
  var vaccination = Vaccination.firstDose.obs;

  final personalFormKey = GlobalKey<FormState>();

  // Variables
  DateTime? dob; //* Null if value is not picked
  File? pickedImage; //* Null if image is not pucked

  //*RegExpressions // --------------->>>>>>>>
  RegExp nameRex =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

//* Form Validation ------------------->>>>>>>
  String? emailvalidation(email) {
    if (email!.isEmpty || email == null) {
      return "Email Field cann't be Empty";
    } else if (!emailRex.hasMatch(email)) {
      return "Enter a valid Email";
    }
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
    if (address!.isEmpty || dob == null)
      return "Please Enter Your Home Adsress";
  }

  //* Top nav button press handler --------->>>>>>
  void buttonPressed({required FormButton formButton}) {
    switch (formButton) {
      case FormButton.personal:
        activeButton.value = FormButton.personal;
        break;
      case FormButton.academic:
        activeButton.value = FormButton.academic;
        break;
      case FormButton.medical:
        activeButton.value = FormButton.medical;
        break;
    }
  }

  //* Bottom nav handlers ---------------->>>>>>>>>>
  void nextButton() {
    switch (activeButton.value) {
      case FormButton.personal:
        if (personalFormKey.currentState!.validate()) {
          DatabaseServiceController().addUsers(String, dynamic);
          activeButton.value = FormButton.academic;
        } else {
          activeButton.value = FormButton.personal;
        }

        break;
      case FormButton.academic:
        activeButton.value = FormButton.medical;
        break;
      case FormButton.medical:
        break;
    }
  }

  void previousButton() {
    switch (activeButton.value) {
      case FormButton.personal:
        break;
      case FormButton.academic:
        activeButton.value = FormButton.personal;
        break;
      case FormButton.medical:
        break;
    }
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
      dobController.text = pickedDateString[0];
    } else {
      dobController.text = "";
    }
    FocusScope.of(context).requestFocus(FocusNode());
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

// Submit button handler
// Vailidiation logic here
  void onSubmit() {}
}
