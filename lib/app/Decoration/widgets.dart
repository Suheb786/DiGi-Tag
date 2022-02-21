import 'package:flutter/cupertino.dart';

import 'colors/originBg.dart';

//* ---Scanner Icon Widget on Home Screen-- //
class ScanIcon extends StatelessWidget {
  const ScanIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Color(0x40000000),
          offset: Offset(10, 10),
          blurRadius: 40,
        )
      ]),
      child: Image.asset(
        'assets/icons/scanicon.png',
      ),
    );
  }
}
