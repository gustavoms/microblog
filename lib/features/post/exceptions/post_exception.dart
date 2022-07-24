class PostException implements Exception {
  String cause;
  PostException({
    required this.cause,
  }) : super();
}
