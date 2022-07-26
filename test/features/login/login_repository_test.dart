import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';
import 'package:microblog/features/login/login_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'login_repository_test.mocks.dart';

@GenerateMocks([
  MicroblogDatabase,
  Database,
])
void main() {
  group('login repository testing cases', () {
    final database = MockMicroblogDatabase();
    final databaseInstance = MockDatabase();
    final loginRepository = LoginRepository(
      database: database,
    );
    final loginRequest = LoginRequest(
      user: 'test',
      password: 'test',
    );
    final loginResponse = LoginResponse(
      success: true,
      user: 'test',
      email: 'test',
      id: 0,
    );
    final loginExecuteException = LoginExecuteException(
      cause: 'fail',
    );
    final loginExecuteResponse = right(loginResponse);
    final loginExecuteExceptionResponse = left(loginExecuteException);

    tearDown(() {
      Get.reset();
    });

    test('should be successfully logged in by email', () async {
      when(database.getInstance()).thenAnswer(
        (_) => Future.value(databaseInstance),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer(
        (_) => Future.value(
          [
            {
              'id': 1,
              'name': 'test',
              'email': 'test@test.com',
              'password': 'test',
            },
          ],
        ),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE name = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer((_) => Future.value([]));

      final result = await loginRepository.loginExecute(
        request: loginRequest,
      );

      result.fold(
        (l) => null,
        (r) => expect(r.success, true),
      );
    });

    test('should be successfully logged in by user', () async {
      when(database.getInstance()).thenAnswer(
        (_) => Future.value(databaseInstance),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer(
        (_) => Future.value(
          [],
        ),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE name = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer(
        (_) => Future.value(
          [
            {
              'id': 1,
              'name': 'test',
              'email': 'test@test.com',
              'password': 'test',
            },
          ],
        ),
      );

      final result = await loginRepository.loginExecute(
        request: loginRequest,
      );

      result.fold(
        (l) => null,
        (r) => expect(r.success, true),
      );
    });

    test('should be fail to login', () async {
      when(database.getInstance()).thenAnswer(
        (_) => Future.value(databaseInstance),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer(
        (_) => Future.value(
          [],
        ),
      );

      when(databaseInstance.rawQuery(
        'SELECT * FROM user WHERE name = ? AND password = ?',
        [
          loginRequest.user,
          loginRequest.password,
        ],
      )).thenAnswer(
        (_) => Future.value(
          [],
        ),
      );

      final result = await loginRepository.loginExecute(
        request: loginRequest,
      );

      result.fold(
        (l) => null,
        (r) => expect(r.success, false),
      );
    });
  });
}
