class LoginResponse {
  final bool success;
  final String user;
  final String email;
  final int id;

  LoginResponse({
    required this.success,
    required this.user,
    required this.email,
    required this.id,
  });
}
