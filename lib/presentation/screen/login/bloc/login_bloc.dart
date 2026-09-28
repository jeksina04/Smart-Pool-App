import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../data/storage/storage.dart';
import '../../../../domain/interactor/interactor.dart';
import '../../../../domain/model/login_model.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, UiState> {
  final Interactor _interactor;

  LoginBloc(this._interactor) : super(const IdleState()) {
    on<SelectRoleEvent>((event, emit) {
      emit(IdleState(
        role: event.role,
        isTermsAccepted: state.isTermsAccepted,
      ));
    });

    on<ToggleTermsEvent>((event, emit) {
      emit(IdleState(
        role: state.role,
        isTermsAccepted: event.isAccepted,
      ));
    });

    on<UserLoginEvent>((event, emit) async {
      emit(LoadingState(
        role: event.role,
        isTermsAccepted: state.isTermsAccepted,
      ));

      try {
        var data = await _interactor.login.invoke(
          role: event.role,
          email: event.email,
          password: event.password,
        );

        if (data.data?.accessToken != null &&
            data.data!.accessToken!.isNotEmpty) {
          final storage = GetIt.I.get<StorageService>();
          storage.authToken = data.data!.accessToken!;
          if (data.data?.refreshToken != null) {
            storage.refreshToken = data.data!.refreshToken!;
          }
          storage.userInfo = data;
        }

        emit(SuccessState<LoginResModel>(
          data,
          role: event.role,
          isTermsAccepted: state.isTermsAccepted,
        ));
      } catch (e) {
        String errorMsg =
            e is HttpException ? e.message : 'Login failed. Please try again.';
        emit(ErrorState(
          errorMsg,
          role: event.role,
          isTermsAccepted: state.isTermsAccepted,
        ));
      }
    });
  }
}
