import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/interactor/interactor.dart';
import '../../../../domain/model/otp_model.dart';
import '../../../../domain/model/reset_password_model.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final Interactor _interactor;

  ForgotPasswordBloc(this._interactor) : super(ForgotPasswordInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        final res = await _interactor.sendOtp.invoke(
          phone: event.phone,
          email: '', // Contract: No email for forgot_password
          purpose: OtpPurpose.forgot_password,
        );
        emit(OtpSentState(res));
      } catch (e) {
        emit(ForgotPasswordError(e.toString()));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        final res = await _interactor.verifyOtp.invoke(
          phone: event.phone,
          code: event.code,
          purpose: OtpPurpose.forgot_password,
        );
        if (res.data?.verificationToken != null) {
          emit(OtpVerifiedState(res.data!.verificationToken!, event.phone));
        } else {
          emit(ForgotPasswordError(res.message ?? "Verification failed"));
        }
      } catch (e) {
        emit(ForgotPasswordError(e.toString()));
      }
    });

    on<SubmitResetPasswordEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        final res = await _interactor.resetPassword.invoke(ResetPasswordReqModel(
          verificationToken: event.token,
          phone: event.phone,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        ));
        emit(ResetPasswordSuccessState(res));
      } catch (e) {
        emit(ForgotPasswordError(e.toString()));
      }
    });
  }
}