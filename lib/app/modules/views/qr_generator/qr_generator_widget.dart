import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widgets/qr_stack.dart';

class QrGeneratorWidget extends StatelessWidget {
  const QrGeneratorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: QrStack(uid: "JIT185151003"),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[500],
            ),
          )
        ],
      ),
    );
  }
}
