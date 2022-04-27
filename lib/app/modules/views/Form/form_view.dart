import 'package:digitag/app/enums/form_buttons.dart';
import 'package:digitag/app/modules/widgets/academic_form_fields.dart';
import 'package:digitag/app/modules/widgets/bit_text.dart';
import 'package:digitag/app/modules/widgets/medical_form_fields.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Decoration/decoration.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/form_bottom_nev_button.dart';
import '../../widgets/form_submit_button.dart';
import '../../widgets/personal_form_fields.dart';

import 'form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Decorations.grdntBG,
        child: SafeArea(
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: screenHeight * 0.2,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Center(child: bigText("DiGi-Tag")),
                  ),
                ),
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.035),
                    child: Container(
                      height: 4,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: const Color(0xff4F4F4F).withOpacity(0.2),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xffCCE0FF).withOpacity(0.2),
                    ),
                    child: Obx(
                      (() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Catagories(
                                labal: "Personal",
                                onPressed: () {
                                  // if (controller.personalFormKey.currentState!
                                  //     .validate())
                                  controller.buttonPressed(
                                    formButton: FormButton.personal,
                                  );
                                },
                                color: controller.activeButton.value ==
                                        FormButton.personal
                                    ? const Color(0xff779FE5)
                                    : const Color(0xffB2C2ED),
                              ),
                              Catagories(
                                labal: "Academic",
                                onPressed: () => controller.buttonPressed(
                                  formButton: FormButton.academic,
                                ),
                                color: controller.activeButton.value ==
                                        FormButton.academic
                                    ? const Color(0xff779FE5)
                                    : const Color(0xffB2C2ED),
                              ),
                              Catagories(
                                labal: "Medical",
                                onPressed: () => controller.buttonPressed(
                                  formButton: FormButton.medical,
                                ),
                                color: controller.activeButton.value ==
                                        FormButton.medical
                                    ? const Color(0xff779FE5)
                                    : const Color(0xffB2C2ED),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Obx(() {
                        switch (controller.activeButton.value) {
                          case FormButton.personal:
                            return PersonalFormFields(
                              screenHeight: screenHeight,
                            );
                          case FormButton.academic:
                            return AcademicFormFields(
                              screenHeight: screenHeight,
                            );
                          case FormButton.medical:
                            return MedicalFormFields(
                                screenHeight: screenHeight);
                          default:
                            return PersonalFormFields(
                                screenHeight: screenHeight);
                        }
                      }),
                    ),
                  ),
                  Obx(() {
                    if (controller.activeButton.value == FormButton.personal ||
                        controller.activeButton.value == FormButton.academic) {
                      return FormBottomNavButton(
                        onPressedBack: controller.previousButton,
                        onPressedNext: controller.nextButton,
                      );
                    } else {
                      return FormSubmitButton(
                        onPressed: controller.onSubmit,
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
