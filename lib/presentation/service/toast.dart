import 'package:flutter/material.dart';

class ToastService {
  errorToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xffdd5a5a),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ));
  }

  successToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xff87cc6c),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ));
  }
}
