abstract class OnboardingState {}

class OnboardingInitialState extends OnboardingState {
  final int pageIndex;
  final int totalPages;

  OnboardingInitialState({
    required this.pageIndex,
    required this.totalPages,
  });
}

class OnboardingPageUpdateState extends OnboardingState {
  final int pageIndex;
  final int totalPages;
  final bool isLastPage;

  OnboardingPageUpdateState({
    required this.pageIndex,
    required this.totalPages,
    required this.isLastPage,
  });
}

class OnboardingCompletedState extends OnboardingState {}
