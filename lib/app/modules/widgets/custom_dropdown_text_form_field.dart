import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownTextFormField extends StatelessWidget {
  final String? hintText;
  final bool isEmpty;
  final String? value;
  final void Function(String?)? onChanged;
  final List<String> dropDownListOfItems;

  const CustomDropdownTextFormField({
    required this.dropDownListOfItems,
    this.isEmpty = false,
    this.hintText,
    this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            isDense: true,
            labelText: hintText,
            labelStyle: TextStyle(
              fontFamily: "Sofia",
              fontSize: 14,
              color: const Color(0xff28407D).withOpacity(0.6),
            ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(
                color: Color(0xffB2C2ED),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                color: const Color(0xffB2C2ED).withOpacity(
                  0.8,
                ),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(195, 255, 21, 21),
                width: 2,
              ),
            ),
          ),
          isEmpty: isEmpty,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(14),
              // style: TextStyle(
              //   // fontFamily: "SofiaPro",
              // ),
              style: TextStyle(
                color: Color(0xff28407D).withOpacity(0.8),
                fontSize: 14,
                fontFamily: "SofiaPro",
              ),
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: dropDownListOfItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
