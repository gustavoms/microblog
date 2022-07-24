import 'package:microblog/features/post/data/post_entity.dart';

class PostResponse {
  final List<PostEntity> posts;

  PostResponse({
    required this.posts,
  });
}
