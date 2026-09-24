/// Arguments passed to the VerifyNumberPage.
class VerifyNumberArgs {
  final String phoneNumber;
  final String? fullName;
  final String? email;

  const VerifyNumberArgs({
    required this.phoneNumber,
    this.fullName,
    this.email,
  });
}
