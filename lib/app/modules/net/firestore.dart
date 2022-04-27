import 'package:digitag/app/modules/controllers/form_controller.dart';
import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FormController controller = Get.find<FormController>();
FirebaseFirestore firestore = FirebaseFirestore.instance;

class AddUsers {
  CollectionReference users = firestore.instance.collection('users');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': controller.nameController, // John Doe
          'email': controller.emailController, // Stokes and Sons
          'dob': controller.dobController,
          'address': controller.addressController // 42
        })
        .then((value) => print(" ${controller.nameController}  Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
