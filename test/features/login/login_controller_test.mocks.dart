// Mocks generated by Mockito 5.2.0 from annotations
// in microblog/test/features/login/login_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:get/get.dart' as _i2;
import 'package:microblog/core/data/storage.dart' as _i3;
import 'package:microblog/core/router/router.dart' as _i7;
import 'package:microblog/features/feed/data/feed_parameters.dart' as _i11;
import 'package:microblog/features/home/exceptions/home_enable_dark_mode_exception.dart'
    as _i14;
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart'
    as _i13;
import 'package:microblog/features/home/home_parameters.dart' as _i9;
import 'package:microblog/features/login/data/login_entity.dart' as _i19;
import 'package:microblog/features/login/data/login_request.dart' as _i17;
import 'package:microblog/features/login/data/login_response.dart' as _i16;
import 'package:microblog/features/login/exceptions/login_execute_exception.dart'
    as _i15;
import 'package:microblog/features/login/login_execute_use_case.dart' as _i18;
import 'package:microblog/features/login/login_repository.dart' as _i6;
import 'package:microblog/features/news/data/news_parameters.dart' as _i12;
import 'package:microblog/features/post/data/post_parameters.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeSnackbarController_0 extends _i1.Fake
    implements _i2.SnackbarController {}

class _FakeIStorage_1 extends _i1.Fake implements _i3.IStorage {}

class _FakeEither_2<L, R> extends _i1.Fake implements _i4.Either<L, R> {}

class _FakeGlobalKey_3<T extends _i5.State<_i5.StatefulWidget>> extends _i1.Fake
    implements _i5.GlobalKey<T> {}

class _FakeGetSnackBar_4 extends _i1.Fake implements _i2.GetSnackBar {
  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeILoginRepository_5 extends _i1.Fake implements _i6.ILoginRepository {
}

/// A class which mocks [IRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockIRouter extends _i1.Mock implements _i7.IRouter {
  MockIRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<TReturnType> startSignupPage<TReturnType>({bool? off = false}) =>
      (super.noSuchMethod(Invocation.method(#startSignupPage, [], {#off: off}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startHomePage<TReturnType>(
          {bool? off = false, _i9.HomeParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startHomePage, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startLoginPage<TReturnType>({bool? off = false}) =>
      (super.noSuchMethod(Invocation.method(#startLoginPage, [], {#off: off}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startPostPage<TReturnType>(
          {bool? off = false, _i10.PostParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startPostPage, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startFeed<TReturnType>(
          {bool? off = false, _i11.FeedParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startFeed, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startNews<TReturnType>(
          {bool? off = false, _i12.NewsParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startNews, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<void> goBack<TReturnType>(
          {TReturnType? result,
          bool? closeOverlays = false,
          bool? canPop = true,
          int? id}) =>
      (super.noSuchMethod(
          Invocation.method(#goBack, [], {
            #result: result,
            #closeOverlays: closeOverlays,
            #canPop: canPop,
            #id: id
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i2.SnackbarController showSnackbarSuccess({String? message}) =>
      (super.noSuchMethod(
          Invocation.method(#showSnackbarSuccess, [], {#message: message}),
          returnValue: _FakeSnackbarController_0()) as _i2.SnackbarController);
  @override
  _i2.SnackbarController showSnackbarError({String? message}) =>
      (super.noSuchMethod(
          Invocation.method(#showSnackbarError, [], {#message: message}),
          returnValue: _FakeSnackbarController_0()) as _i2.SnackbarController);
}

/// A class which mocks [HomeEnableDarkModeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeEnableDarkModeUseCase extends _i1.Mock
    implements _i13.HomeEnableDarkModeUseCase {
  MockHomeEnableDarkModeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IStorage get storage => (super.noSuchMethod(Invocation.getter(#storage),
      returnValue: _FakeIStorage_1()) as _i3.IStorage);
  @override
  _i8.Future<_i4.Either<_i14.HomeEnableDarkModeException, bool>> call(
          {bool? enable}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#enable: enable}),
              returnValue: Future<
                      _i4.Either<_i14.HomeEnableDarkModeException, bool>>.value(
                  _FakeEither_2<_i14.HomeEnableDarkModeException, bool>()))
          as _i8.Future<_i4.Either<_i14.HomeEnableDarkModeException, bool>>);
}

/// A class which mocks [IStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockIStorage extends _i1.Mock implements _i3.IStorage {
  MockIStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<bool> isDarkMode() =>
      (super.noSuchMethod(Invocation.method(#isDarkMode, []),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<void> setDarkMode(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setDarkMode, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setUserId(int? value) =>
      (super.noSuchMethod(Invocation.method(#setUserId, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<int> getUserId() =>
      (super.noSuchMethod(Invocation.method(#getUserId, []),
          returnValue: Future<int>.value(0)) as _i8.Future<int>);
  @override
  _i8.Future<void> setUserName(String? value) =>
      (super.noSuchMethod(Invocation.method(#setUserName, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<String> getUserName() =>
      (super.noSuchMethod(Invocation.method(#getUserName, []),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<void> setUserEmail(String? value) =>
      (super.noSuchMethod(Invocation.method(#setUserEmail, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<String> getUserEmail() =>
      (super.noSuchMethod(Invocation.method(#getUserEmail, []),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
}

/// A class which mocks [ILoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockILoginRepository extends _i1.Mock implements _i6.ILoginRepository {
  MockILoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>> loginExecute(
          {_i17.LoginRequest? request}) =>
      (super.noSuchMethod(
          Invocation.method(#loginExecute, [], {#request: request}),
          returnValue:
              Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>>.value(
                  _FakeEither_2<_i15.LoginExecuteException,
                      _i16.LoginResponse>())) as _i8
          .Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>>);
}

/// A class which mocks [SnackbarController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackbarController extends _i1.Mock
    implements _i2.SnackbarController {
  MockSnackbarController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GlobalKey<_i2.GetSnackBarState> get key =>
      (super.noSuchMethod(Invocation.getter(#key),
              returnValue: _FakeGlobalKey_3<_i2.GetSnackBarState>())
          as _i5.GlobalKey<_i2.GetSnackBarState>);
  @override
  _i2.GetSnackBar get snackbar =>
      (super.noSuchMethod(Invocation.getter(#snackbar),
          returnValue: _FakeGetSnackBar_4()) as _i2.GetSnackBar);
  @override
  _i8.Future<void> get future => (super.noSuchMethod(Invocation.getter(#future),
      returnValue: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> close({bool? withAnimations = true}) => (super.noSuchMethod(
      Invocation.method(#close, [], {#withAnimations: withAnimations}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> show() => (super.noSuchMethod(Invocation.method(#show, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
}

/// A class which mocks [HomeEnableDarkModeException].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeEnableDarkModeException extends _i1.Mock
    implements _i14.HomeEnableDarkModeException {
  MockHomeEnableDarkModeException() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get cause =>
      (super.noSuchMethod(Invocation.getter(#cause), returnValue: '')
          as String);
  @override
  set cause(String? _cause) =>
      super.noSuchMethod(Invocation.setter(#cause, _cause),
          returnValueForMissingStub: null);
}

/// A class which mocks [LoginExecuteUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginExecuteUseCase extends _i1.Mock
    implements _i18.LoginExecuteUseCase {
  MockLoginExecuteUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.ILoginRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeILoginRepository_5()) as _i6.ILoginRepository);
  @override
  _i3.IStorage get storage => (super.noSuchMethod(Invocation.getter(#storage),
      returnValue: _FakeIStorage_1()) as _i3.IStorage);
  @override
  _i8.Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>> call(
          {_i19.LoginEntity? data}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#data: data}),
          returnValue:
              Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>>.value(
                  _FakeEither_2<_i15.LoginExecuteException,
                      _i16.LoginResponse>())) as _i8
          .Future<_i4.Either<_i15.LoginExecuteException, _i16.LoginResponse>>);
}
