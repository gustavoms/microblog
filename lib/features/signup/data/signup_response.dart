class SignupResponse {
  final bool success;

  SignupResponse({
    required this.success,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      success: json['success'],
    );
  }
}
