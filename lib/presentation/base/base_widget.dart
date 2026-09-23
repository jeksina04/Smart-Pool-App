import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../service/navigation.dart';
import '../service/toast.dart';

abstract class BaseWidget extends StatelessWidget {
  BaseWidget({super.key});

  final navigation = GetIt.I<NavigationService>();
  final _toast = GetIt.I<ToastService>();

  showError(BuildContext context, String message) {
    _toast.errorToast(context, message);
  }

  showSuccess(BuildContext context, String message) {
    _toast.successToast(context, message);
  }
}
