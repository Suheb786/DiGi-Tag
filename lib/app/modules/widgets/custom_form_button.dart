import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String labal;
  final Color color;
  const CustomFormButton({
    Key? key,
    required this.onPressed,
    required this.labal,
    this.color = const Color(0xffB2C2ED),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        // visualDensity: VisualDensity(vertical: 0),
        textStyle: TextStyle(
          fontFamily: "SofiaPro",
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.white.withOpacity(0.8),
        ),
        primary: color,
      ),
      onPressed: onPressed,
      child: Text(labal),
    );
  }
}
