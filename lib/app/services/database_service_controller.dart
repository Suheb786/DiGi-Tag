import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/modules/controllers/form_controller.dart';

import 'package:get/get.dart';

class DatabaseServiceController extends GetxController {
  FormController controller = Get.find<FormController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addUsers(String, dynamic) async {
    final users = firestore.collection('users');
    addUser(users);
  }

  Future<void> addUser(var users) {
    return users
        .add({
          'full_name': controller.nameController.text,
          'email': controller.emailController.text,
          'dob': controller.dobController.text,
          'address': controller.addressController.text
        })
        .then((value) => print(" ${controller.nameController} ye bhai Added"))
        .catchError(
            (error) => print("Failed to add user: $error bahut sari errors"));
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
