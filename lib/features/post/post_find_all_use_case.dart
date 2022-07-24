import 'package:dartz/dartz.dart';
import 'package:microblog/features/post/data/post_response.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';
import 'package:microblog/features/post/post_repository.dart';

class PostFindAllUseCase {
  final IPostRepository repository;

  PostFindAllUseCase({
    required this.repository,
  });

  Future<Either<PostException, PostResponse>> call() async {
    return await repository.findAll();
  }
}
