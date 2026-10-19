import 'login_event.dart';

abstract class UiState<T> {
  final UserRole role;
  final bool isTermsAccepted;

  const UiState({
    this.role = UserRole.customer,
    this.isTermsAccepted = false,
  });
}

class IdleState extends UiState {
  const IdleState({
    super.role = UserRole.customer,
    super.isTermsAccepted = false,
  });
}

class LoadingState extends UiState {
  const LoadingState({
    super.role,
    super.isTermsAccepted,
  });
}

class ErrorState extends UiState {
  final String message;

  const ErrorState(
    this.message, {
    super.role,
    super.isTermsAccepted,
  });
}

class SuccessState<T> extends UiState<T> {
  final T loginResponse;

  const SuccessState(
    this.loginResponse, {
    super.role,
    super.isTermsAccepted,
  });
}
