import 'package:microblog/features/feed/data/feed_entity.dart';

class FeedResponse {
  final List<FeedEntity> posts;

  FeedResponse({
    required this.posts,
  });
}
