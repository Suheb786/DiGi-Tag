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

 
}
