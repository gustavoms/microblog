import 'package:dartz/dartz.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';
import 'package:microblog/features/post/post_repository.dart';

class PostDeleteUseCase {
  final IPostRepository repository;

  PostDeleteUseCase({
    required this.repository,
  });

  Future<Either<PostException, bool>> call({
    required int id,
  }) async {
    return await repository.delete(id: id);
  }
}
