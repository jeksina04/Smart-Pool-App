import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/interactor/interactor.dart';
import '../../login/bloc/login_state.dart';
import '../verify_number_args.dart';
import 'verify_otp_event.dart';
import 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, UiState> {
  final Interactor _interactor;
  final VerifyNumberArgs args;

  VerifyOtpBloc(this._interactor, {required this.args})
      : super(const VerifyOtpIdleState()) {
    on<VerifyAndRegisterEvent>((event, emit) async {
      emit(const VerifyOtpLoadingState());

      try {
        // 1. Call Verify OTP API
        await _interactor.verifyOtp.invoke(
          phone: args.phoneNumber,
          code: event.code,
          purpose: args.purpose,
          countryCode: 'US',
        );

        // 2. If verify OTP succeeds, immediately call Register API
        final registerRes = await _interactor.register.invoke(
          fullName: args.fullName ?? '',
          email: args.email ?? '',
          phone: args.phoneNumber,
          password: args.password ?? '',
        );

        emit(VerifyAndRegisterSuccessState(registerRes));
      } catch (e) {
        final errorMsg = e is HttpException
            ? e.message
            : 'Verification failed. Please try again.';
        emit(VerifyOtpErrorState(errorMsg));
      }
    });

    on<ResendOtpEvent>((event, emit) async {
      try {
        final res = await _interactor.sendOtp.invoke(
          phone: args.phoneNumber,
          email: args.email ?? '',
          purpose: args.purpose,
          countryCode: 'US',
        );
        emit(ResendOtpSuccessState(res));
      } catch (e) {
        final errorMsg = e is HttpException
            ? e.message
            : 'Failed to resend code. Please try again.';
        emit(VerifyOtpErrorState(errorMsg));
      }
    });
  }
}
