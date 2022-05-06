import 'package:flutter/material.dart';

import '../../Decoration/decoration.dart';

class LoadingOnAuthStateCheck extends StatelessWidget {
  const LoadingOnAuthStateCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Decorations.grdntBG,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: const Color(0xff42FFDD),
                  color: const Color(0xff002C45).withOpacity(0.9),
                ),
                const SizedBox(height: 20),
                Text(
                  "Loading...",
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff002C45).withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ],
      
    );
  }
}
