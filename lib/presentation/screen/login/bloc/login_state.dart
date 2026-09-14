

abstract class UiState<T> {}

class IdleState extends UiState {}

class LoadingState extends UiState {}

class ErrorState extends UiState {
  final String message;

  ErrorState(this.message);
}

class SuccessState<T> extends UiState {
  final T loginResponse;

  SuccessState(this.loginResponse);
}
