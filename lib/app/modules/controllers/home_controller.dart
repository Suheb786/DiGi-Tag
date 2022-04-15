import 'package:digitag/app/modules/views/home_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var setScreen = 0.obs;

  @override
  void onInit() {
    setScreen.value = 0;
    
    super.onInit();
  }

}
