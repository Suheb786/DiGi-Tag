import 'package:digitag/app/modules/screens/Form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioButton extends GetView<FormController> {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        activeColor: const Color(0xff28407D),

        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Align(
          child: FittedBox(
            child: Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 14,
                color: const Color(0xff28407D).withOpacity(0.8),
              ),
            ),
          ),
          alignment: const Alignment(-1.6, 0),
        ),
        //  visualDensity: VisualDensity.compact,
      ),
    );
  }
}
