import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
