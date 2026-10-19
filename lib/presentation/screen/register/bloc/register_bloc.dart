import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/interactor/interactor.dart';
import '../../../../domain/model/otp_model.dart';
import '../../login/bloc/login_state.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, UiState> {
  final Interactor _interactor;

  RegisterBloc(this._interactor) : super(const RegisterIdleState()) {
    on<RegisterSendOtpEvent>((event, emit) async {
      emit(const RegisterLoadingState());

      try {
        final response = await _interactor.sendOtp.invoke(
          phone: event.phone,
          email: event.email,
          purpose: OtpPurpose.register,
          countryCode: 'US',
        );

        emit(RegisterOtpSentSuccessState(
          response,
          fullName: event.fullName,
          email: event.email,
          phone: event.phone,
          password: event.password,
        ));
      } catch (e) {
        final errorMsg = e is HttpException
            ? e.message
            : 'Failed to send verification code. Please try again.';
        emit(RegisterErrorState(errorMsg));
      }
    });
  }
}
