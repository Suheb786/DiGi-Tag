//* ---Medical Support Icons Widget -- //

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalSupportIcon extends StatelessWidget {
  const MedicalSupportIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Color(0x26ffffff)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/icons/MedicalSupport.svg',
          ),
        ),
      ),
    );
  }
}
