import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaButton extends StatelessWidget {
  final String url;
  const SocialMediaButton({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 30,
        // minRadius: 10,
        // maxRadius: 30,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(url),
      ),
    );
  }
}
