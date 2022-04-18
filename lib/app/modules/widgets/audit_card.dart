import 'package:flutter/material.dart';

import '../../Decoration/colors/app_colors.dart';

class AuditCard extends StatelessWidget {
  const AuditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Faculty Name",
                style: TextStyle(
                  fontFamily: "SofiaPro",
                  fontWeight: FontWeight.bold,
                  color: AppColors.auditOnCardName,
                ),
              ),
              Spacer(),
              Text(
                "CSE",
                style: TextStyle(
                  fontFamily: "SofiaPro",
                  fontStyle: FontStyle.italic,
                  color: AppColors.auditOnCardBranch,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
