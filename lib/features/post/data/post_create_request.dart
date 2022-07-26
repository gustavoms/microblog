class PostCreateRequest {
  final int userId;
  final String message;
  final String date;

  PostCreateRequest({
    required this.userId,
    required this.message,
    required this.date,
  });
}
