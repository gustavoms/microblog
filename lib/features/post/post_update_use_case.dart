import 'package:dartz/dartz.dart';
import 'package:microblog/features/post/data/post_update_request.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';
import 'package:microblog/features/post/post_repository.dart';

class PostUpdateUseCase {
  final IPostRepository repository;

  PostUpdateUseCase({
    required this.repository,
  });

  Future<Either<PostException, bool>> call({
    required PostUpdateRequest data,
  }) async {
    return await repository.update(data: data);
  }
}
