import 'package:microblog/features/post/data/post_create_request.dart';

class PostUpdateRequest extends PostCreateRequest {
  final int postId;

  PostUpdateRequest({
    required this.postId,
    required int userId,
    required String message,
  }) : super(
          userId: userId,
          message: message,
        );
}
