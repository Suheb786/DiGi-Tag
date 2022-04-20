import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AuditToggleButton extends StatelessWidget {
  final bool value;
  final void Function(bool) onToggle;
  const AuditToggleButton({
    required this.onToggle,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FlutterSwitch(
        value: value,
        padding: 2,
        onToggle: onToggle,
        valueFontSize: 9,
        showOnOff: true,
        inactiveText: "Audit On",
        activeText: "OFF",
        width: 75,
        height: 27,
        inactiveColor: const Color(0x80004E79),
        activeColor: const Color(0x80004E79),
        inactiveToggleColor: const Color(0x9942FFDD),
        inactiveToggleBorder:
            Border.all(width: 1, color: const Color(0x663347B4)),
      ),
    );
  }
}
