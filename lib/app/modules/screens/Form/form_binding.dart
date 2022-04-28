import 'package:digitag/app/modules/screens/Form/form_controller/academicDetails_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/personalDetails_controller.dart';
import 'package:get/get.dart';

import 'form_controller/form_controller.dart';
import 'form_controller/medicalDetails_controller.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<FormController>(
    //   () => FormController(),
    // );
    Get.put(FormController());
    Get.put(PersonalDetailsController());

    Get.put(MedicalDetailsController());
    Get.put(AcademicDetailsController());
  }
}
