import 'dart:io';

import 'package:digitag/app/modules/screens/Form/form_controller/academicDetails_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/form_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/medicalDetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsController extends GetxController {
   
  

  FormController formController = Get.find<FormController>();
  // MedicalDetailsController medicalDetailsController =
  //     Get.find<MedicalDetailsController>();
  // AcademicDetailsController academicDetailsController =
  //     Get.find<AcademicDetailsController>();

  //* Variables >>>>>>>>>

 // Null if value is not picked
   // Null if image is not pucked





 

  
  //*Form Check---------->>>>>>>

  bool checkPersonalDetails() {
    if (Get.find<FormController>().personalFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  
}
