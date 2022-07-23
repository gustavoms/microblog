import 'package:microblog/features/feed/data/feed_entity.dart';
import 'package:microblog/features/feed/feed_repository.dart';

class FeedResponse {
  final List<FeedEntity> posts;

  FeedResponse({
    required this.posts,
  });
}
