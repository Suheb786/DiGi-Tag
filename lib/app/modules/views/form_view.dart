import 'package:digitag/app/enums/form_buttons.dart';
import 'package:digitag/app/modules/widgets/bit_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Decoration/decoration.dart';
import '../controllers/form_controller.dart';

import '../widgets/custom_form_button.dart';
import '../widgets/custom_text_form_field.dart';

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
                    background: Center(child: BigText("DiGi-Tag")),
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
                              CustomFormButton(
                                labal: "Personal",
                                onPressed: () => controller.buttonPressed(
                                  formButton: FormButton.personal,
                                ),
                                color: controller.activeButton.value ==
                                        FormButton.personal
                                    ? const Color(0xff779FE5)
                                    : const Color(0xffB2C2ED),
                              ),
                              CustomFormButton(
                                labal: "Academic",
                                onPressed: () => controller.buttonPressed(
                                  formButton: FormButton.academic,
                                ),
                                color: controller.activeButton.value ==
                                        FormButton.academic
                                    ? const Color(0xff779FE5)
                                    : const Color(0xffB2C2ED),
                              ),
                              CustomFormButton(
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.03,
                          left: 25,
                          right: 25,
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              padding: EdgeInsets.only(
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
                                  color: Color.fromRGBO(178, 194, 237, 1),
                                ),
                              ),
                              child: Form(
                                child: Column(
                                  // mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomTextformField(
                                      labelText: "Full Name",
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextformField(
                                      labelText: "Email",
                                      keyboardType: TextInputType.emailAddress,
                                      textCapitalization:
                                          TextCapitalization.none,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextformField(
                                      onTap: () {},
                                      labelText: "DOB",
                                      keyboardType: TextInputType.none,
                                      textCapitalization:
                                          TextCapitalization.none,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextformField(
                                      labelText: "Address",
                                      keyboardType: TextInputType.text,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 42,
                                backgroundColor:
                                    Color.fromRGBO(178, 194, 237, 1),
                                child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "assets/icons/Avatar.png",
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
