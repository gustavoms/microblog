class NewsResponse {
  List<News>? news;

  NewsResponse({
    this.news,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }
}

class News {
  User? user;
  Message? message;

  News({
    this.user,
    this.message,
  });

  News.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }
}

class User {
  String? name;
  String? profilePicture;

  User({
    this.name,
    this.profilePicture,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
  }
}

class Message {
  String? content;
  DateTime? createdAt;

  Message({
    this.content,
    this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();
  }
}
