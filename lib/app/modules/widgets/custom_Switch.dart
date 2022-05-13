//* Flutter Switch Toggle *//

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.status,
  }) : super(key: key);

  final RxBool status;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: status.value,
      padding: 1,
      onToggle: (val) {
        if (status.value == false) {
          status.value = true;
          print("Audit On");
        } else {
          status.value = false;
          print("Audit Off");
        }
      },
      valueFontSize: 9,
      showOnOff: true,
      inactiveText: "Audit Off",
      activeText: "Audit On",
      activeTextColor: Color(0xffBAFFEE),
      inactiveTextColor: Color(0xffBAFFEE),
      width: 75,
      inactiveIcon: Icon(
        Icons.festival,
        color: Colors.white,
      ),
      activeToggleBorder: Border.all(width: 1, color: Color(0x663347B4)),
      height: 27,
      inactiveColor: Color(0x80004E79),
      activeColor: Color(0x80004E79),
      inactiveToggleColor: Color(0x9942FFDD),
      inactiveToggleBorder: Border.all(width: 1, color: Color(0x663347B4)),
    );
  }
}
