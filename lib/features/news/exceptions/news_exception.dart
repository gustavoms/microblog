class NewsException implements Exception {
  String cause;
  NewsException({
    required this.cause,
  }) : super();
}
