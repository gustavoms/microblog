import 'package:flutter_test/flutter_test.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/signup/data/signup_request.dart';
import 'package:microblog/features/signup/signup_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'signup_repository_test.mocks.dart';

@GenerateMocks([
  MicroblogDatabase,
  Database,
])
void main() {
  group('signup repository test cases', () {
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

    test('should be successful signup', () async {
      final mockInstance = await mockMicroblogDatabase.getInstance();

      when(mockInstance.rawInsert(
        'INSERT INTO user (name, email, password) VALUES(?, ?, ?)',
        [
          'test',
          'test@test.com',
          'test',
        ],
      )).thenAnswer((_) => Future.value(1));

      final repository = SignupRepository(database: mockMicroblogDatabase);

      final response = await repository.signupExecute(
        request: SignupRequest(
          user: 'test',
          email: 'test@test.com',
          password: 'test',
        ),
      );

      response.fold(
        (l) => null,
        (r) => expect(r.success, true),
      );
    });
  });
}
