// Mocks generated by Mockito 5.2.0 from annotations
// in microblog/test/features/post/post_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter/material.dart' as _i6;
import 'package:get/get.dart' as _i5;
import 'package:microblog/core/data/database.dart' as _i4;
import 'package:microblog/core/data/storage.dart' as _i16;
import 'package:microblog/core/router/router.dart' as _i17;
import 'package:microblog/features/feed/data/feed_parameters.dart' as _i20;
import 'package:microblog/features/home/home_parameters.dart' as _i18;
import 'package:microblog/features/news/data/news_parameters.dart' as _i21;
import 'package:microblog/features/post/data/post_create_request.dart' as _i10;
import 'package:microblog/features/post/data/post_parameters.dart' as _i19;
import 'package:microblog/features/post/data/post_request.dart' as _i15;
import 'package:microblog/features/post/data/post_response.dart' as _i14;
import 'package:microblog/features/post/data/post_update_request.dart' as _i12;
import 'package:microblog/features/post/exceptions/post_exception.dart' as _i9;
import 'package:microblog/features/post/post_create_use_case.dart' as _i7;
import 'package:microblog/features/post/post_delete_use_case.dart' as _i13;
import 'package:microblog/features/post/post_repository.dart' as _i2;
import 'package:microblog/features/post/post_update_use_case.dart' as _i11;
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

class _FakeIPostRepository_0 extends _i1.Fake implements _i2.IPostRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeMicroblogDatabase_2 extends _i1.Fake
    implements _i4.MicroblogDatabase {}

class _FakeSnackbarController_3 extends _i1.Fake
    implements _i5.SnackbarController {}

class _FakeGlobalKey_4<T extends _i6.State<_i6.StatefulWidget>> extends _i1.Fake
    implements _i6.GlobalKey<T> {}

class _FakeGetSnackBar_5 extends _i1.Fake implements _i5.GetSnackBar {
  @override
  String toString({_i6.DiagnosticLevel? minLevel = _i6.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [PostCreateUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostCreateUseCase extends _i1.Mock implements _i7.PostCreateUseCase {
  MockPostCreateUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IPostRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeIPostRepository_0()) as _i2.IPostRepository);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> call(
          {_i10.PostCreateRequest? data}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#data: data}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
}

/// A class which mocks [PostUpdateUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostUpdateUseCase extends _i1.Mock implements _i11.PostUpdateUseCase {
  MockPostUpdateUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IPostRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeIPostRepository_0()) as _i2.IPostRepository);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> call(
          {_i12.PostUpdateRequest? data}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#data: data}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
}

/// A class which mocks [PostDeleteUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostDeleteUseCase extends _i1.Mock implements _i13.PostDeleteUseCase {
  MockPostDeleteUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IPostRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeIPostRepository_0()) as _i2.IPostRepository);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> call({int? id}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#id: id}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
}

/// A class which mocks [PostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRepository extends _i1.Mock implements _i2.PostRepository {
  MockPostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MicroblogDatabase get database =>
      (super.noSuchMethod(Invocation.getter(#database),
          returnValue: _FakeMicroblogDatabase_2()) as _i4.MicroblogDatabase);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> create(
          {_i10.PostCreateRequest? data}) =>
      (super.noSuchMethod(Invocation.method(#create, [], {#data: data}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> delete({int? id}) =>
      (super.noSuchMethod(Invocation.method(#delete, [], {#id: id}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
  @override
  _i8.Future<_i3.Either<_i9.PostException, _i14.PostResponse>> findAll() =>
      (super.noSuchMethod(Invocation.method(#findAll, []),
          returnValue:
              Future<_i3.Either<_i9.PostException, _i14.PostResponse>>.value(
                  _FakeEither_1<_i9.PostException, _i14.PostResponse>())) as _i8
          .Future<_i3.Either<_i9.PostException, _i14.PostResponse>>);
  @override
  _i8.Future<_i3.Either<_i9.PostException, _i14.PostResponse>> find(
          {_i15.PostRequest? request}) =>
      (super.noSuchMethod(Invocation.method(#find, [], {#request: request}),
          returnValue:
              Future<_i3.Either<_i9.PostException, _i14.PostResponse>>.value(
                  _FakeEither_1<_i9.PostException, _i14.PostResponse>())) as _i8
          .Future<_i3.Either<_i9.PostException, _i14.PostResponse>>);
  @override
  _i8.Future<_i3.Either<_i9.PostException, bool>> update(
          {_i12.PostUpdateRequest? data}) =>
      (super.noSuchMethod(Invocation.method(#update, [], {#data: data}),
              returnValue: Future<_i3.Either<_i9.PostException, bool>>.value(
                  _FakeEither_1<_i9.PostException, bool>()))
          as _i8.Future<_i3.Either<_i9.PostException, bool>>);
}

/// A class which mocks [IStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockIStorage extends _i1.Mock implements _i16.IStorage {
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

/// A class which mocks [IRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockIRouter extends _i1.Mock implements _i17.IRouter {
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
          {bool? off = false, _i18.HomeParameters? parameters}) =>
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
          {bool? off = false, _i19.PostParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startPostPage, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startFeed<TReturnType>(
          {bool? off = false, _i20.FeedParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startFeed, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i8.Future<TReturnType>);
  @override
  _i8.Future<TReturnType> startNews<TReturnType>(
          {bool? off = false, _i21.NewsParameters? parameters}) =>
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
  _i5.SnackbarController showSnackbarSuccess({String? message}) =>
      (super.noSuchMethod(
          Invocation.method(#showSnackbarSuccess, [], {#message: message}),
          returnValue: _FakeSnackbarController_3()) as _i5.SnackbarController);
  @override
  _i5.SnackbarController showSnackbarError({String? message}) =>
      (super.noSuchMethod(
          Invocation.method(#showSnackbarError, [], {#message: message}),
          returnValue: _FakeSnackbarController_3()) as _i5.SnackbarController);
}

/// A class which mocks [SnackbarController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackbarController extends _i1.Mock
    implements _i5.SnackbarController {
  MockSnackbarController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.GlobalKey<_i5.GetSnackBarState> get key =>
      (super.noSuchMethod(Invocation.getter(#key),
              returnValue: _FakeGlobalKey_4<_i5.GetSnackBarState>())
          as _i6.GlobalKey<_i5.GetSnackBarState>);
  @override
  _i5.GetSnackBar get snackbar =>
      (super.noSuchMethod(Invocation.getter(#snackbar),
          returnValue: _FakeGetSnackBar_5()) as _i5.GetSnackBar);
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
