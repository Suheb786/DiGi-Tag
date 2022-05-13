import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration SlidableDecoration() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
}
