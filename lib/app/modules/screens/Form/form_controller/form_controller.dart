import 'dart:io';
import 'package:digitag/app/modules/screens/Form/form_controller/academicDetails_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/medicalDetails_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/personalDetails_controller.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
//* Finding Controllers ---------------------------------------->>>>>>>>
  PersonalDetailsController personalDetailsController =
      Get.find<PersonalDetailsController>();
  MedicalDetailsController medicalDetailsController =
      Get.find<MedicalDetailsController>();
  AcademicDetailsController academicDetailsController =
      Get.find<AcademicDetailsController>();

  //* Form controllers------------------------------------------>>>>>>>>>>>
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
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

  //* Bottom Navigation handlers ---------------->>>>>>>>>>
  void nextButton() {
    switch (activeButton.value) {
      case FormButton.personal:
        if (personalDetailsController.checkPersonalDetails()) {
          activeButton.value = FormButton.academic;
        }

        break;
      case FormButton.academic:
        if (academicDetailsController.academicFormKey.currentState!
                .validate() &&
            academicDetailsController.validateDropDownFields()) {}
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

  void onSubmit() {
    if (academicDetailsController.checkAcademicDetails() &&
        personalDetailsController.checkPersonalDetails()) {
      print("Form is valid");

      //! Make a map of all data here and upload to db
    } else {
      Get.snackbar(
        "Validiation Faild",
        "One or more fields are not valid",
      );
    }
  }
}
