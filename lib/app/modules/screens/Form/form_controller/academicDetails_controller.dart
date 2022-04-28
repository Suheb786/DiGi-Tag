import 'package:digitag/app/modules/screens/Form/form_controller/form_controller.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';

class AcademicDetailsController extends GetxController {
  //* Observable variables------------------->>>>>>>>>>>>
  var activeButton = FormButton.personal.obs;
  var studentType = StudentType.hosteler.obs;
  var vaccination = Vaccination.firstDose.obs;

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
      Get.snackbar(
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
          "Empty Fields",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        messageText: Text(
          "Selection of Course, Branch, Semester are required",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      );
    } else {
      activeButton.value = FormButton.medical;
    }
  }

  //* Academic Details Form Validation methods ------------------->>>>>>>

  String? validateRollNo(rollNo) {
    if (rollNo!.toString().isEmpty ||
        rollNo == null && rollNo.toString().length <= 10) {
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
}
