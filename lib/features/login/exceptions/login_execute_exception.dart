class LoginExecuteException implements Exception {
  String cause;
  LoginExecuteException({
    required this.cause,
  }) : super();
}
