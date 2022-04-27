import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitag/app/modules/controllers/form_controller.dart';

import 'package:get/get.dart';

FormController controller = Get.find<FormController>();
FirebaseFirestore firestore = FirebaseFirestore.instance;

class Database {
  Future addUsers(String, dynamic) async {
    final users = firestore.collection('users');
    addUser(users);
  }

  Future<void> addUser(var users) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': controller.nameController.text, // John Doe
          'email': controller.emailController.text, // Stokes and Sons
          'dob': controller.dobController.text,
          'address': controller.addressController.text // 42
        })
        .then((value) => print(" ${controller.nameController} ye bhai Added"))
        .catchError(
            (error) => print("Failed to add user: $error bahut sari errors"));
  }
}
