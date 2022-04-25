import 'package:digitag/app/enums/form_buttons.dart';
import 'package:digitag/app/modules/bindings/form_binding.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var activeButton = FormButton.personal.obs;

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
}
