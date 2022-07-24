class NewsEntity {
  UserNews? user;
  MessageNews? message;

  NewsEntity({
    this.user,
    this.message,
  });
}

class UserNews {
  String? name;
  String? profilePicture;

  UserNews({
    this.name,
    this.profilePicture,
  });
}

class MessageNews {
  String? content;
  DateTime? createdAt;

  MessageNews({
    this.content,
    this.createdAt,
  });
}
