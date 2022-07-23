class FeedException implements Exception {
  String cause;
  FeedException({
    required this.cause,
  }) : super();
}
