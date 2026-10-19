/// Model representing an Onboarding slide item
class OnboardingItem {
  final String? titleKey;
  final String subtitleKey;
  final String? logoAsset;
  final String? woodmarkAsset;

  const OnboardingItem({
    this.titleKey,
    required this.subtitleKey,
    this.logoAsset,
    this.woodmarkAsset,
  });
}
