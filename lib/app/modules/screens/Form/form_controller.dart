import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/services/database_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/auth_service_controller.dart';
import '../../widgets/enums.dart';

class FormController extends GetxController {
  var visible = true.obs;
  //* Form controllers------------------------------------------>>>>>>>>>>>
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController enrollmentNoController = TextEditingController();
  TextEditingController bloodGroupcontroller = TextEditingController();
  TextEditingController allergyController = TextEditingController();

  //* Observable variables------------------->>>>>>>>>>>>
  var activeButton = FormButton.personal.obs;
  var studentType = UserType.student.obs;
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

  String studentcheck() {
    if (studentType.value == UserType.student) {
      return "Hostelers";
    } else {
      return "DayScholar";
    }
  }

  String vaccinationcheck() {
    if (vaccination == Vaccination.firstDose) {
      return "Partially Vaccinated";
    } else {
      return "Fully Vaccinated";
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
    "Computer Science Engineering",
    "Mechanical Engineering",
    "Civil Engineering",
    "Electrical Engineering",
    "Artificial Intelligence Engineering",
  ];
  String? cityValidation(city) {
    if (city.toString().isEmpty) {
      return "Enter Your City Name";
    }
  }

//* Semester Dropdown Lists ----------->>>>>>>>>>>
  List<String> semesterList = [
    "1*",
    "2*",
    "3*",
    "4*",
  ];
  validateDropDownFields() {
    if (currentSelectedBranch.value.isEmpty ||
        currentSelectedCourse.value.isEmpty ||
        currentSelectedSemester.value.isEmpty) {
      showRedSnackbar(
        "Empty Fields",
        "Selection of Course, Branch, Semester are required",
      );
    } else {
      activeButton.value = FormButton.medical;
    }
  }

  SnackbarController showRedSnackbar(text, massage) {
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

  SnackbarController showGreenSnackbar(
      {required String text,
      required String massage,
      SnackPosition snackPosition = SnackPosition.TOP}) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: Colors.green,
      borderRadius: 5,
      snackPosition: snackPosition,
      colorText: Colors.white,
      dismissDirection: DismissDirection.horizontal,
      icon: const Icon(
        Icons.check_rounded,
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
    if (rollNo.toString().length < 9) {
      return "Please Enter a Valid Roll No.";
    }
  }

  String? validateEnrollNo(enrollNo) {
    if (enrollNo!.toString().isEmpty ||
        enrollNo == null && enrollNo.toString().length <= 10) {
      return "Please Enter a Valid Enrollment No.";
    }
  }

  String? validateEmployeeNo(enrollNo) {
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
      showRedSnackbar("Profile Pic not added",
          "You have to upload a profile pic that will be visible on your public profile");
  }

  bool checkPersonalDetails() {
    if (checkPickedImage() && personalFormKey.currentState!.validate()) {
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

//!-------------------------- Firebase work ----------------------->>>//

//*-- databse writing ---->>
  checkSubmitButton() async {
    final phoneNo = Get.find<AuthServiceController>().getPhoneNumber;
    studentcheck();
    if (medicalFormKey.currentState!.validate()) {
      Map<String, dynamic> addUser = {
        'uid':Get.find<AuthServiceController>().getUid,
        'isAdmin': false,
        'full_name': nameController.text,
        'email': emailController.text,
        'dob': dobController.text,
        'city': cityController.text,
        'address': addressController.text,
        'course': currentSelectedCourse.value.toString(),
        'branch': currentSelectedBranch.value.toString(),
        'semester': currentSelectedSemester.value.toString(),
        'roll_no': rollNoController.text,
        'enrollment_no': enrollmentNoController.text,
        'blood_group': bloodGroupcontroller.text,
        'alergy': allergyController.text,
        'student_type': studentcheck(),
        'vacination': vaccinationcheck(),
        'phoneNo': phoneNo,
      };
      Get.find<DatabaseServiceController>().addUsers(addUser);
    }
  }

//*-------- Databse read --------->>>>

  // final Stream<QuerySnapshot> users =
  //     FirebaseFirestore.instance.collection('users').snapshots();
}
