import 'package:digitag/app/modules/screens/Form/form_controller.dart';

import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_dropdown_text_form_field.dart';
import 'custom_radio_button.dart';
import 'custom_text_form_field.dart';

class AcademicFormFields extends GetView<FormController> {
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
          key: controller.academicFormKey,
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
                        if (controller.studentType.value ==
                            StudentType.hosteler) {
                          StudentType.hosteler;
                        } else {
                          StudentType.dayScholor;
                        }
                        // controller.studentcheck();

                        // controller.studentType.value = val as StudentType;
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
                  dropDownListOfItems: controller.courseList,
                  onChanged: (newValue) {
                    controller.currentSelectedCourse.value = newValue ?? "";
                  },
                  hintText: "Course",
                  isEmpty: controller.currentSelectedCourse.value.isEmpty
                      ? true
                      : false,
                  value: controller.currentSelectedCourse.value.isEmpty
                      ? null
                      : controller.currentSelectedCourse.value,
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CustomDropdownTextFormField(
                  dropDownListOfItems: controller.branchList,
                  onChanged: (newValue) {
                    controller.currentSelectedBranch.value = newValue ?? "";
                  },
                  hintText: "Branch",
                  isEmpty: controller.currentSelectedBranch.value.isEmpty
                      ? true
                      : false,
                  value: controller.currentSelectedBranch.value.isEmpty
                      ? null
                      : controller.currentSelectedBranch.value,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CustomDropdownTextFormField(
                  dropDownListOfItems: controller.semesterList,
                  onChanged: (newValue) {
                    controller.currentSelectedSemester.value = newValue ?? "";
                  },
                  hintText: "Semester",
                  isEmpty: controller.currentSelectedSemester.value.isEmpty
                      ? true
                      : false,
                  value: controller.currentSelectedSemester.value.isEmpty
                      ? null
                      : controller.currentSelectedSemester.value,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                validator: (p0) => controller.validateRollNo(p0),
                controller: controller.rollNoController,
                labelText: "Roll no.",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                validator: (p0) => controller.validateEnrollNo(p0),
                controller: controller.enrollmentNoController,
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
