import 'package:dartz/dartz.dart';
import 'package:microblog/features/post/data/post_create_request.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';
import 'package:microblog/features/post/post_repository.dart';

class PostCreateUseCase {
  final IPostRepository repository;

  PostCreateUseCase({
    required this.repository,
  });

  Future<Either<PostException, bool>> call({
    required PostCreateRequest data,
  }) async {
    return await repository.create(data: data);
  }
}
