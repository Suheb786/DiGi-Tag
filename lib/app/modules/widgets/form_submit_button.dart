import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final void Function()? onPressed;
  const FormSubmitButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 13.0,
          horizontal: 22,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff779FE5),
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          onPressed: onPressed,
          child: const Text(
            "Submit",
            style: TextStyle(
              fontFamily: "SofiaPro",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
