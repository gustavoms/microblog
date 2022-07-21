class LoginResponse {
  final bool success;

  LoginResponse({
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
    );
  }
}
