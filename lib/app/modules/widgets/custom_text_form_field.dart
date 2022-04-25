import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  final String? labelText;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  void Function()? onTap;
  CustomTextformField({
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      onTap: onTap,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      cursorRadius: const Radius.circular(10),
      cursorHeight: 17,
      cursorColor: const Color(0xff28407D),
      style: TextStyle(
        fontFamily: "SofiaPro",
        fontSize: 16,
        color: const Color(0xff28407D).withOpacity(0.8),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        isDense: true,
        labelText: labelText,
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
    );
  }
}
