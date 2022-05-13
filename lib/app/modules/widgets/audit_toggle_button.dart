import 'package:digitag/app/Decoration/colors/app_colors.dart';
import 'package:digitag/app/modules/screens/Profile/profile_controller.dart';
import 'package:digitag/app/modules/widgets/badge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import 'enums.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 30,
      ),
      child: Get.find<ProfileController>().status.value
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BadgeButton(
                  icon: Voting.up,
                  value: "11",
                ),
                FlutterSwitch(
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
                const BadgeButton(
                  icon: Voting.down,
                  value: "3",
                ),
              ],
            )
          : FlutterSwitch(
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
