import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages;
  int _currentPage = 0;

  OnboardingBloc({this.totalPages = 3})
      : super(OnboardingInitialState(pageIndex: 0, totalPages: totalPages)) {
    on<OnboardingPageChangedEvent>((event, emit) {
      _currentPage = event.pageIndex;
      emit(OnboardingPageUpdateState(
        pageIndex: _currentPage,
        totalPages: totalPages,
        isLastPage: _currentPage == totalPages - 1,
      ));
    });

    on<OnboardingNextPressedEvent>((event, emit) {
      if (_currentPage < totalPages - 1) {
        _currentPage++;
        emit(OnboardingPageUpdateState(
          pageIndex: _currentPage,
          totalPages: totalPages,
          isLastPage: _currentPage == totalPages - 1,
        ));
      } else {
        emit(OnboardingCompletedState());
      }
    });

    on<OnboardingSkipPressedEvent>((event, emit) {
      emit(OnboardingCompletedState());
    });
  }

  int get currentPage => _currentPage;
}
