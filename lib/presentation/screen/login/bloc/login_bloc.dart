import 'dart:io';

import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/data/storage/storage.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/interactor/interactor.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, UiState> {
  final Interactor _interactor;

  LoginBloc(this._interactor) : super(IdleState()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoadingState());

      try {
        var data = await _interactor.login.invoke(event.email, event.password);
        emit(SuccessState(data));
      } catch (e) {
        if (e is HttpException) emit(ErrorState(e.message));
      }
    });
  }

  void changeLanguage(EzLocalizationBuilderState ezLocalizationBuilderState,
      String newLanguage) {
    var storage = GetIt.I<StorageService>();

    if (storage.appLocale.languageCode != newLanguage) {
      ezLocalizationBuilderState;
      storage.appLocale = Locale(newLanguage);
    }
  }
}
