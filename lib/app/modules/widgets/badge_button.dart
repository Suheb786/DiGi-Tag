import 'package:badges/badges.dart';
import 'package:digitag/app/modules/widgets/enums.dart';
import 'package:flutter/material.dart';

import '../../Decoration/colors/app_colors.dart';

class BadgeButton extends StatelessWidget {
  final String value;
  final Voting icon;
  const BadgeButton({
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      padding: const EdgeInsets.all(3),
      badgeContent: Text(
        value,
        style: const TextStyle(
          fontFamily: "SofiaPro",
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: AppColors.badgeNumberColor,
        ),
      ),
      badgeColor: Colors.white,
      position: BadgePosition.topEnd(
        end: -6,
        top: -6,
      ),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: Image.asset(
                  icon == Voting.up
                      ? "assets/icons/profile_icons/like_Icon.png"
                      : "assets/icons/profile_icons/dislikeIcon.png",
                ).image),
            shape: BoxShape.circle),
      ),
    );
  }
}
