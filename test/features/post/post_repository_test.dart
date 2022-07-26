import 'package:flutter_test/flutter_test.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/post/data/post_create_request.dart';
import 'package:microblog/features/post/data/post_update_request.dart';
import 'package:microblog/features/post/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([
  MicroblogDatabase,
  Database,
])
void main() {
  group('post repository test cases', () {
    final mockMicroblogDatabase = MockMicroblogDatabase();
    final mockDatabase = MockDatabase();

    setUp(() {
      when(mockMicroblogDatabase.getInstance())
          .thenAnswer((_) => Future.value(mockDatabase));
    });

    test('should be fine', () {
      final database = MicroblogDatabase();
      expect(database, isA<MicroblogDatabase>());
    });

    test('should be successful create post', () async {
      final mockInstance = await mockMicroblogDatabase.getInstance();
      final date = DateTime.now().toIso8601String();

      when(mockInstance.rawInsert(
        'insert into post (user_id, post, date) values (?, ?, ?)',
        [
          1,
          'test',
          date,
        ],
      )).thenAnswer((_) => Future.value(1));

      final repository = PostRepository(database: mockMicroblogDatabase);

      final response = await repository.create(
        data: PostCreateRequest(
          userId: 1,
          message: 'test',
          date: date,
        ),
      );

      response.fold(
        (l) => null,
        (r) => expect(r, true),
      );
    });

    test('should be successful update post', () async {
      final mockInstance = await mockMicroblogDatabase.getInstance();
      final date = DateTime.now().toIso8601String();

      when(mockInstance.rawUpdate(
        'update post set post = ? where id = ?',
        [
          'test',
          1,
        ],
      )).thenAnswer((_) => Future.value(1));

      final repository = PostRepository(database: mockMicroblogDatabase);

      final response = await repository.update(
        data: PostUpdateRequest(
          userId: 1,
          message: 'test',
          date: date,
          postId: 1,
        ),
      );

      response.fold(
        (l) => null,
        (r) => expect(r, true),
      );
    });

    test('should be successful delete post', () async {
      final mockInstance = await mockMicroblogDatabase.getInstance();

      when(mockInstance.rawDelete(
        'delete from post where id = ?',
        [
          1,
        ],
      )).thenAnswer((_) => Future.value(1));

      final repository = PostRepository(database: mockMicroblogDatabase);

      final response = await repository.delete(
        id: 1,
      );

      response.fold(
        (l) => null,
        (r) => expect(r, true),
      );
    });
  });
}
