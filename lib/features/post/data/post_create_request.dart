class PostCreateRequest {
  final int userId;
  final String message;

  PostCreateRequest({
    required this.userId,
    required this.message,
  });
}
