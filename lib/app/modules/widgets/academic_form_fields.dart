import 'package:digitag/app/modules/screens/Form/form_controller/form_controller.dart';
import 'package:digitag/app/modules/screens/Form/form_controller/personalDetails_controller.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/Form/form_controller/academicDetails_controller.dart';
import '../screens/Form/form_controller/medicalDetails_controller.dart';
import 'custom_dropdown_text_form_field.dart';
import 'custom_radio_button.dart';
import 'custom_text_form_field.dart';

class AcademicFormFields extends GetView<AcademicDetailsController> {
  FormController formController = Get.find<FormController>();
  // MedicalDetailsController medicalDetailsController =
  //     Get.find<MedicalDetailsController>();
  // AcademicDetailsController academicDetailsController =
  //     Get.find<AcademicDetailsController>();
  // PersonalDetailsController personalDetailsController =
  //     Get.find<PersonalDetailsController>();
  AcademicFormFields({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.03,
        left: 25,
        right: 25,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(178, 194, 237, 1),
          ),
        ),
        child: Form(
          key: formController.academicFormKey,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Row(
                  children: [
                    CustomRadioButton(
                      title: "Hosteler",
                      groupValue: controller.studentType.value,
                      value: StudentType.hosteler,
                      onChanged: (val) {
                        controller.studentType.value = val as StudentType;
                      },
                    ),
                    CustomRadioButton(
                      title: "Day Scholar",
                      value: StudentType.dayScholor,
                      groupValue: controller.studentType.value,
                      onChanged: (val) {
                        controller.studentType.value = val as StudentType;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // CustomTextformField(
              //   controller:controller.courseController,
              //   labelText: "Cource",
              //   keyboardType: TextInputType.text,
              //   textCapitalization: TextCapitalization.characters,
              // ),

              Obx(
                () => CustomDropdownTextFormField(
                  dropDownListOfItems: formController.courseList,
                  onChanged: (newValue) {
                    formController.currentSelectedCourse.value = newValue ?? "";
                  },
                  hintText: "Course",
                  isEmpty: formController.currentSelectedCourse.value.isEmpty
                      ? true
                      : false,
                  value: formController.currentSelectedCourse.value.isEmpty
                      ? null
                      : formController.currentSelectedCourse.value,
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CustomDropdownTextFormField(
                  dropDownListOfItems: formController.branchList,
                  onChanged: (newValue) {
                    formController.currentSelectedBranch.value = newValue ?? "";
                  },
                  hintText: "Branch",
                  isEmpty: formController.currentSelectedBranch.value.isEmpty
                      ? true
                      : false,
                  value: formController.currentSelectedBranch.value.isEmpty
                      ? null
                      : formController.currentSelectedBranch.value,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CustomDropdownTextFormField(
                  dropDownListOfItems: formController.semesterList,
                  onChanged: (newValue) {
                    formController.currentSelectedSemester.value = newValue ?? "";
                  },
                  hintText: "Semester",
                  isEmpty: formController.currentSelectedSemester.value.isEmpty
                      ? true
                      : false,
                  value: formController.currentSelectedSemester.value.isEmpty
                      ? null
                      : formController.currentSelectedSemester.value,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                validator: (p0) => controller.validateRollNo(p0),
                controller: formController.rollNoController,
                labelText: "Roll no.",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                validator: (p0) => controller.validateEnrollNo(p0),
                controller: formController.enrollmentNoController,
                labelText: "Enrollment No.",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
