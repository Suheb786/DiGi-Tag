import 'package:digitag/app/modules/screens/Form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'enums.dart';
import 'custom_radio_button.dart';
import 'custom_text_form_field.dart';

class MedicalFormFields extends GetView<FormController> {
  MedicalFormFields({
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
          key: controller.medicalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Covid Vaccination :",
                style: TextStyle(color: Color(0xcc28407D), fontFamily: "sofia"),
              ),
              Obx(
                () => Row(
                  children: [
                    CustomRadioButton(
                      title: "1st Dose Only",
                      groupValue: controller.vaccination.value,
                      value: Vaccination.firstDose,
                      onChanged: (val) {
                        if (controller.vaccination.value ==
                            Vaccination.firstDose) {
                          controller.vaccination.value = Vaccination.secondDose;
                        } else {
                          controller.vaccination.value = Vaccination.firstDose;
                        }
                      },
                    ),
                    CustomRadioButton(
                      title: "2nd Dose",
                      value: Vaccination.secondDose,
                      groupValue: controller.vaccination.value,
                      onChanged: (val) {
                        controller.vaccination.value = val as Vaccination;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                validator: (blood) => controller.bloodGroup(blood),
                autoValid: AutovalidateMode.onUserInteraction,
                controller: controller.bloodGroupcontroller,
                labelText: "Blood group type",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                maxLength: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextformField(
                controller: controller.allergyController,
                labelText: "Mention if any allergy",
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
