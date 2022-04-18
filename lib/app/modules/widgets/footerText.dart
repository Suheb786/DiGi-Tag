import 'package:flutter/material.dart';

import 'login_in_widgets.dart';

Column FooterText() {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text(
            "UID* is Provided on your Digi-Tag.",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 11,
              fontFamily: 'Sofia',
              color: Color(0xB3FFFFFF),
            ),
          ),
        ),
      ),
      const Custom_Contact_Text(),
      SizedBox(
        height: 20,
      )
    ],
  );
}
