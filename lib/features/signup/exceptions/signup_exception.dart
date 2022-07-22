class SignupException implements Exception {
  String cause;
  SignupException({
    required this.cause,
  }) : super();
}
