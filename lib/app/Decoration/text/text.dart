import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text customText(String words, double size) {
  return Text(
    words,
    style: TextStyle(
        fontFamily: 'SofiaPro',
        color: Color(0xffDDFFF7),
        fontSize: size,
        fontWeight: FontWeight.w700),
  );
}
