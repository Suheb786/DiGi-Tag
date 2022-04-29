// import 'package:digitag/app/modules/screens/Form/form_controller.dart';
// import 'package:get/get.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:get/get.dart';

// class DatabaseServiceController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future addUsers(Map<String, dynamic> userData) async {
  //   final users = firestore.collection('users');
  //   users.add(addUser);
  // }

//   // Future<void> addUser(var users) {
//   //   return users
//   //       .add({
//   //         'full_name': controller.nameController.text,
//   //         'email': controller.emailController.text,
//   //         'dob': controller.dobController.text,
//   //         'address': controller.addressController.text
//   //       })
//   //       .then((value) => print(" ${controller.nameController} ye bhai Added"))
//   //       .catchError(
//   //           (error) => print("Failed to add user: $error bahut sari errors"));
//   // }

//   final addUser = {
//     'full_name': Get.find<FormController>().nameController.text,
//     'email': Get.find<FormController>().emailController.text,
//     'dob': Get.find<FormController>().dobController.text,
//     'address': Get.find<FormController>().addressController.text,
//     'course': Get.find<FormController>().currentSelectedCourse.value,
//     'branch': Get.find<FormController>().currentSelectedBranch.value,
//     'semester': Get.find<FormController>().currentSelectedSemester.value,
//     'roll_no': Get.find<FormController>().rollNoController.text,
//     'enrollment_no': Get.find<FormController>().enrollmentNoController.text,
//     'blood_group': Get.find<FormController>().bloodGroupcontroller.text,
//     'alergy': Get.find<FormController>().allergyController.text,
//     'student_type': Get.find<FormController>().studentcheck().text,

//     // 'vactination dose' :
//   };

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {}
//   void increment() => count.value++;
// }
