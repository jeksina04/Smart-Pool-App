abstract class OnboardingEvent {}

class OnboardingPageChangedEvent extends OnboardingEvent {
  final int pageIndex;
  OnboardingPageChangedEvent(this.pageIndex);
}

class OnboardingNextPressedEvent extends OnboardingEvent {}

class OnboardingSkipPressedEvent extends OnboardingEvent {}
