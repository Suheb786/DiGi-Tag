import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformField extends StatelessWidget {
  final String? labelText;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  void Function()? onTap;
  AutovalidateMode? autoValid;
  int? maxLength;
  CustomTextformField({
    this.maxLines = 1,
    this.suffixIcon,
    this.maxLength,
    this.autoValid,
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
      maxLength: maxLength,
      autovalidateMode: autoValid,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      cursorRadius: const Radius.circular(10),
      cursorHeight: 17,
      cursorColor: const Color(0xff28407D),
      style: TextStyle(
        fontFamily: "SofiaPro",
        fontSize: 14,
        color: const Color(0xff28407D).withOpacity(0.8),
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(
            color: Color(0xffB2C2ED),
            width: 2,
          ),
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
        errorStyle: GoogleFonts.montserrat(
            fontSize: 10, color: Colors.white.withOpacity(0.75)),
      ),
    );
  }
}
