class SignupRequest {
  final String user;
  final String email;
  final String password;

  SignupRequest({
    required this.user,
    required this.email,
    required this.password,
  });

  toJson() => {
        'user': user,
        'email': email,
        'password': password,
      };
}
