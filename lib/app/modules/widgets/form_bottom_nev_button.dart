import 'package:flutter/material.dart';

class FormBottomNavButton extends StatelessWidget {
  final void Function()? onPressedBack;
  final void Function()? onPressedNext;
   const FormBottomNavButton({
    required this.onPressedBack,
    required this.onPressedNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 13.0,
        horizontal: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: onPressedBack,
            // elevation: 2.0,

            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25.0,
            ),
            padding: EdgeInsets.all(13.0),
            shape: const CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: onPressedNext,
            // elevation: 2.0,
            fillColor: const Color(0xff779FE5),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25.0,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(13.0),
            shape: const CircleBorder(),
          )
        ],
      ),
    );
  }
}
