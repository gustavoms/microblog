import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/post/data/post_create_request.dart';
import 'package:microblog/features/post/data/post_entity.dart';
import 'package:microblog/features/post/data/post_request.dart';
import 'package:microblog/features/post/data/post_response.dart';
import 'package:microblog/features/post/data/post_update_request.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';

abstract class IPostRepository {
  Future<Either<PostException, PostResponse>> find({
    required PostRequest request,
  });
  Future<Either<PostException, PostResponse>> findAll();
  Future<Either<PostException, bool>> update({
    required PostUpdateRequest data,
  });
  Future<Either<PostException, bool>> create({
    required PostCreateRequest data,
  });
  Future<Either<PostException, bool>> delete({
    required int id,
  });
}

class PostRepository extends IPostRepository {
  final MicroblogDatabase database;

  PostRepository({
    required this.database,
  });

  @override
  Future<Either<PostException, bool>> create({
    required PostCreateRequest data,
  }) async {
    try {
      final id = await (await database.getInstance()).rawInsert(
        'insert into post (user_id, post, date) values (?, ?, ?)',
        [
          data.userId,
          data.message,
          DateTime.now().toIso8601String(),
        ],
      );

      return right(id > 0);
    } on Exception catch (e) {
      return Left(
        PostException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<PostException, bool>> delete({
    required int id,
  }) async {
    log('delete id = $id');
    try {
      final changes = await (await database.getInstance()).rawDelete(
        'delete from post where id = ?',
        [
          id,
        ],
      );
      return right(changes > 0);
    } on Exception catch (e) {
      return Left(
        PostException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<PostException, PostResponse>> findAll() async {
    try {
      final posts = await (await database.getInstance()).rawQuery(
        'select p.id as postId, p.user_id as userId, u.name as name, p.post as post, p.date as date from post p left join user u on u.id = p.user_id order by p.date desc',
      );

      return right(
        PostResponse(
          posts: posts
              .map(
                (e) => PostEntity(
                  userId: e['userId'] as int,
                  id: e['postId'] as int,
                  user: e['name'].toString(),
                  message: e['post'].toString(),
                  date: DateTime.tryParse(
                        e['date'].toString(),
                      ) ??
                      DateTime.now(),
                  photo:
                      'https://picsum.photos/id/${(e['postId'] as int) * 5}/200',
                ),
              )
              .toList(),
        ),
      );
    } on Exception catch (e) {
      return Left(
        PostException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<PostException, PostResponse>> find({
    required PostRequest request,
  }) async {
    try {
      final posts = await (await database.getInstance()).rawQuery(
        'select * from post p left join user u on u.id = p.user_id where user_id = ? order by p.date desc',
        [
          request.userId,
        ],
      );

      return right(
        PostResponse(
          posts: posts
              .map(
                (e) => PostEntity(
                  userId: int.tryParse(e['user_id'].toString()) ?? 0,
                  id: int.tryParse(e['p.id'].toString()) ?? 0,
                  user: e['name'].toString(),
                  message: e['post'].toString(),
                  date: DateTime.tryParse(
                        e['date'].toString(),
                      ) ??
                      DateTime.now(),
                  photo:
                      'https://picsum.photos/id/${(int.tryParse(e['id'].toString()) ?? 1) * 5}/200',
                ),
              )
              .toList(),
        ),
      );
    } on Exception catch (e) {
      return Left(
        PostException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<PostException, bool>> update({
    required PostUpdateRequest data,
  }) async {
    try {
      final changes = await (await database.getInstance()).rawUpdate(
        'update post set post = ? where id = ?',
        [
          data.message,
          data.postId,
        ],
      );

      return right(changes > 0);
    } on Exception catch (e) {
      return Left(
        PostException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }
}
