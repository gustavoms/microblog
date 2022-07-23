class LoginResponse {
  final bool success;
  final String user;
  final String email;

  LoginResponse({
    required this.success,
    required this.user,
    required this.email,
  });
}
