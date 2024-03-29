class FeedEntity {
  final int id;
  final int userId;
  final String user;
  final DateTime date;
  final String photo;
  final String message;

  FeedEntity({
    required this.id,
    required this.userId,
    required this.user,
    required this.date,
    required this.message,
    required this.photo,
  });
}
