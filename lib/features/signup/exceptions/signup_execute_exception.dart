class SignupExecuteException implements Exception {
  String cause;
  SignupExecuteException({
    required this.cause,
  }) : super();
}
