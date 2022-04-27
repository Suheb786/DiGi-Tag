import 'package:digitag/app/enums/student_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/form_controller.dart';
import 'custom_radio_button.dart';
import 'custom_text_form_field.dart';

class AcademicFormFields extends GetView<FormController> {
  const AcademicFormFields({
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
              CustomTextformField(
                controller:controller.courseController,
                labelText: "Cource",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                controller: controller.branchController,
                labelText: "Branch",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                controller: controller.semesterController,
                labelText: "Semester",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                controller: controller.rollNoController,
                labelText: "Roll no.",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
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
