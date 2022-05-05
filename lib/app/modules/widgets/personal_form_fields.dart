import 'package:digitag/app/modules/screens/Form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'custom_text_form_field.dart';

class PersonalFormFields extends GetView<FormController> {
  PersonalFormFields({
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
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(
              top: 60,
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
              key: controller.personalFormKey,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextformField(
                    controller: controller.nameController,
                    labelText: "Full Name",
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: (name) => controller.fullnameValidation(name),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextformField(
                    controller: controller.emailController,
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    validator: (email) => controller.emailvalidation(email),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextformField(
                    onTap: () => controller.dobDatePicker(context: context),
                    labelText: "DOB",
                    keyboardType: TextInputType.none,
                    textCapitalization: TextCapitalization.none,
                    controller: controller.dobController,
                    validator: (dob) => controller.dobValidation(dob),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextformField(
                    controller: controller.cityController,
                    labelText: "City",
                    textCapitalization: TextCapitalization.words,
                    validator: (city) => controller.cityValidation(city),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextformField(
                    controller: controller.addressController,
                    labelText: "Address",
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 3,
                    validator: (address) =>
                        controller.addressValidation(address),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () async {
                await controller.picImage(context);
              },
              child: CircleAvatar(
                radius: 42,
                backgroundColor: const Color.fromRGBO(178, 194, 237, 1),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: GetBuilder<FormController>(
                    builder: (controller) {
                      if (controller.pickedImage == null) {
                        return Image.asset(
                          "assets/icons/Avatar.png",
                          height: 50,
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              controller.pickedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
