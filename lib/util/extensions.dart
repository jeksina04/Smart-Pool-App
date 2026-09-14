import 'package:flutter/material.dart';

extension Texts on TextEditingController {
  String get trimmedText => text.trim();
}

extension Validations on String {
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isPasswordValid => RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
      .hasMatch(this);

  bool get isPhoneValid => RegExp(r'^[0-9]{6,16}$').hasMatch(this);
}
