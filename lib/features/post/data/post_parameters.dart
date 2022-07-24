import 'package:microblog/features/post/data/post_entity.dart';

class PostParameters {
  final PostEntity? post;

  PostParameters({
    this.post,
  });

  get isEditing => post != null;
}
