import 'dart:io';

import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:digitag/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  //* Form controllers------------------------------------------>>>>>>>>>>>
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  TextEditingController rollNoController = TextEditingController();
  TextEditingController enrollmentNoController = TextEditingController();
  TextEditingController bloodGroupcontroller = TextEditingController();
  TextEditingController allergyController = TextEditingController();

  //* Observable variables------------------->>>>>>>>>>>>
  var activeButton = FormButton.personal.obs;
  var studentType = StudentType.hosteler.obs;
  var vaccination = Vaccination.firstDose.obs;

  //* Catagory button press handler --------->>>>>>
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

  studentcheck() {
    if (studentType.value == StudentType.hosteler) {
      studentType.value = StudentType.dayScholor;
    } else {
      studentType.value = StudentType.hosteler;
    }
  }

  //* Bottom Navigation handlers ---------------->>>>>>>>>>
  void nextButton() {
    switch (activeButton.value) {
      case FormButton.personal:
        if (checkPersonalDetails()) {
          activeButton.value = FormButton.academic;
        }

        break;
      case FormButton.academic:
        if (checkAcademicDetails()) {
          activeButton.value = FormButton.medical;
        }
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

  //* FormKeys ------>>>>>>>>>

  final medicalFormKey = GlobalKey<FormState>();

  var currentSelectedCourse = "".obs;
  var currentSelectedBranch = "".obs;
  var currentSelectedSemester = "".obs;

  final academicFormKey = GlobalKey<FormState>();

//* Course Dropdown Lists ----------->>>>>>>>>>>
  List<String> courseList = [
    "B.Tech",
    "Diploma",
    "B.Pharma",
    "D.Pharma",
    "B.A.",
    "M.A.",
    "B.Com.",
    "MBA",
    "Media",
  ];

//* Branch Dropdown Lists ----------->>>>>>>>>>>
  List<String> branchList = [
    "CSE",
    "ME",
    "CE",
    "EE",
    "AI",
  ];

//* Semester Dropdown Lists ----------->>>>>>>>>>>
  List<String> semesterList = [
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th",
  ];
  validateDropDownFields() {
    if (currentSelectedBranch.value.isEmpty ||
        currentSelectedCourse.value.isEmpty ||
        currentSelectedSemester.value.isEmpty) {
      showSnackbar(
        "Empty Fields",
        "Selection of Course, Branch, Semester are required",
      );
    } else {
      activeButton.value = FormButton.medical;
    }
  }

  SnackbarController showSnackbar(text, massage) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: Colors.red,
      borderRadius: 5,
      colorText: Colors.white,
      dismissDirection: DismissDirection.horizontal,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      titleText: Text(
        text,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, color: Colors.white),
      ),
      messageText: Text(
        massage,
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }

  //* Academic Details Form Validation methods ------------------->>>>>>>

  String? validateRollNo(rollNo) {
    if (rollNo!.toString().isEmpty || rollNo.toString().length <= 10) {
      return "Please Enter a Valid Roll No.";
    }
  }

  String? validateEnrollNo(enrollNo) {
    if (enrollNo!.toString().isEmpty ||
        enrollNo == null && enrollNo.toString().length <= 10) {
      return "Please Enter a Valid Enrollment No.";
    }
  }

  bool checkAcademicDetails() {
    if (academicFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final personalFormKey = GlobalKey<FormState>();

  //* Variables >>>>>>>>>

  DateTime? dob; // Null if value is not picked
  File? pickedImage; // Null if image is not pucked

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
//* MedicalDetail Validation ------------>>>>>>>

  String? bloodGroup(blood) {
    if (!bloodGroupRex.hasMatch(blood) || blood == null) {
      return "Enter a valid Blood Type";
    }
  }

  //*Form Check---------->>>>>>>

  checkPickedImage() {
    if (pickedImage != null) {
      return true;
    } else
      showSnackbar("Profile Pic not added",
          "You have to upload a profile pic that will be visible on your public profile");
  }

  bool checkPersonalDetails() {
    if (checkPickedImage() && personalFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  checkSubmitButton() {
    if (medicalFormKey.currentState!.validate()) {
      // addUsers();

      // Get.offAllNamed(Routes.DRAWER);
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
      dobController.text = pickedDateString[0];
    } else {
      dobController.text = "";
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

  //*RegExpressions // --------------->>>>>>>>
  RegExp bloodGroupRex = RegExp(r"^(A|B|AB|O)[+-]?$");
  RegExp nameRex =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
