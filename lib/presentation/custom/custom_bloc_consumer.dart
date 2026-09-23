import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/base/base_widget.dart';

import '../screen/login/bloc/login_state.dart';

class CustomBlocConsumer<T extends StateStreamable<R>, R> extends BaseWidget {
  final Function(BuildContext context, R state) listener;
  final Widget Function(BuildContext context, R state) builder;

  CustomBlocConsumer({super.key, required this.builder, required this.listener});

  handleApiError(
      BuildContext context, Object? state, Function handleOtherState) {
    if (state is ErrorState) showError(context, state.message);
    handleOtherState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, R>(
      listener: (context, state) {
        handleApiError(context, state, () {
          listener(context, state);
        });
      },
      builder: (context, state) {
        return builder(context, state);
      },
    );
  }
}
