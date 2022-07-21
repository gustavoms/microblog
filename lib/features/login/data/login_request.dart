class LoginRequest {
  final String user;
  final String password;

  LoginRequest({
    required this.user,
    required this.password,
  });

  toJson() => {
        'user': user,
        'password': password,
      };
}
