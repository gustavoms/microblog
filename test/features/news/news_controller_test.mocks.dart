// Mocks generated by Mockito 5.2.0 from annotations
// in microblog/test/features/news/news_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i4;
import 'package:get/get.dart' as _i2;
import 'package:microblog/core/data/api.dart' as _i5;
import 'package:microblog/core/router/router.dart' as _i6;
import 'package:microblog/features/feed/data/feed_parameters.dart' as _i10;
import 'package:microblog/features/home/home_parameters.dart' as _i8;
import 'package:microblog/features/news/data/news_entity.dart' as _i14;
import 'package:microblog/features/news/data/news_parameters.dart' as _i11;
import 'package:microblog/features/news/data/news_request.dart' as _i15;
import 'package:microblog/features/news/data/news_response.dart' as _i16;
import 'package:microblog/features/news/exceptions/news_exception.dart' as _i13;
import 'package:microblog/features/news/news_find_all_use_case.dart' as _i12;
import 'package:microblog/features/news/news_repository.dart' as _i3;
import 'package:microblog/features/post/data/post_parameters.dart' as _i9;
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

class _FakeINewsRepository_1 extends _i1.Fake implements _i3.INewsRepository {}

class _FakeEither_2<L, R> extends _i1.Fake implements _i4.Either<L, R> {}

class _FakeApi_3 extends _i1.Fake implements _i5.Api {}

class _FakeDuration_4 extends _i1.Fake implements Duration {}

class _FakeGetHttpClient_5 extends _i1.Fake implements _i2.GetHttpClient {}

class _FakeInternalFinalCallback_6<T> extends _i1.Fake
    implements _i2.InternalFinalCallback<T> {}

class _FakeResponse_7<T> extends _i1.Fake implements _i2.Response<T> {}

class _FakeGetSocket_8 extends _i1.Fake implements _i2.GetSocket {}

class _FakeGraphQLResponse_9<T> extends _i1.Fake
    implements _i2.GraphQLResponse<T> {}

/// A class which mocks [IRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockIRouter extends _i1.Mock implements _i6.IRouter {
  MockIRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<TReturnType> startSignupPage<TReturnType>({bool? off = false}) =>
      (super.noSuchMethod(Invocation.method(#startSignupPage, [], {#off: off}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<TReturnType> startHomePage<TReturnType>(
          {bool? off = false, _i8.HomeParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startHomePage, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<TReturnType> startLoginPage<TReturnType>({bool? off = false}) =>
      (super.noSuchMethod(Invocation.method(#startLoginPage, [], {#off: off}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<TReturnType> startPostPage<TReturnType>(
          {bool? off = false, _i9.PostParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startPostPage, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<TReturnType> startFeed<TReturnType>(
          {bool? off = false, _i10.FeedParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startFeed, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<TReturnType> startNews<TReturnType>(
          {bool? off = false, _i11.NewsParameters? parameters}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #startNews, [], {#off: off, #parameters: parameters}),
              returnValue: Future<TReturnType>.value(null))
          as _i7.Future<TReturnType>);
  @override
  _i7.Future<void> goBack<TReturnType>(
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
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
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

/// A class which mocks [NewsFindAllUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsFindAllUseCase extends _i1.Mock
    implements _i12.NewsFindAllUseCase {
  MockNewsFindAllUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.INewsRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeINewsRepository_1()) as _i3.INewsRepository);
  @override
  _i7.Future<_i4.Either<_i13.NewsException, List<_i14.NewsEntity>>> call(
          {_i15.NewsRequest? data}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#data: data}),
              returnValue: Future<
                      _i4.Either<_i13.NewsException,
                          List<_i14.NewsEntity>>>.value(
                  _FakeEither_2<_i13.NewsException, List<_i14.NewsEntity>>()))
          as _i7.Future<_i4.Either<_i13.NewsException, List<_i14.NewsEntity>>>);
}

/// A class which mocks [NewsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRepository extends _i1.Mock implements _i3.NewsRepository {
  MockNewsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Api get api =>
      (super.noSuchMethod(Invocation.getter(#api), returnValue: _FakeApi_3())
          as _i5.Api);
  @override
  _i7.Future<_i4.Either<_i13.NewsException, _i16.NewsResponse>> findNews(
          {_i15.NewsRequest? request}) =>
      (super.noSuchMethod(Invocation.method(#findNews, [], {#request: request}),
              returnValue: Future<
                      _i4.Either<_i13.NewsException, _i16.NewsResponse>>.value(
                  _FakeEither_2<_i13.NewsException, _i16.NewsResponse>()))
          as _i7.Future<_i4.Either<_i13.NewsException, _i16.NewsResponse>>);
}

/// A class which mocks [Api].
///
/// See the documentation for Mockito's code generation for more information.
class MockApi extends _i1.Mock implements _i5.Api {
  MockApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get allowAutoSignedCert =>
      (super.noSuchMethod(Invocation.getter(#allowAutoSignedCert),
          returnValue: false) as bool);
  @override
  set allowAutoSignedCert(bool? _allowAutoSignedCert) => super.noSuchMethod(
      Invocation.setter(#allowAutoSignedCert, _allowAutoSignedCert),
      returnValueForMissingStub: null);
  @override
  String get userAgent =>
      (super.noSuchMethod(Invocation.getter(#userAgent), returnValue: '')
          as String);
  @override
  set userAgent(String? _userAgent) =>
      super.noSuchMethod(Invocation.setter(#userAgent, _userAgent),
          returnValueForMissingStub: null);
  @override
  bool get sendUserAgent =>
      (super.noSuchMethod(Invocation.getter(#sendUserAgent), returnValue: false)
          as bool);
  @override
  set sendUserAgent(bool? _sendUserAgent) =>
      super.noSuchMethod(Invocation.setter(#sendUserAgent, _sendUserAgent),
          returnValueForMissingStub: null);
  @override
  set baseUrl(String? _baseUrl) =>
      super.noSuchMethod(Invocation.setter(#baseUrl, _baseUrl),
          returnValueForMissingStub: null);
  @override
  String get defaultContentType => (super
          .noSuchMethod(Invocation.getter(#defaultContentType), returnValue: '')
      as String);
  @override
  set defaultContentType(String? _defaultContentType) => super.noSuchMethod(
      Invocation.setter(#defaultContentType, _defaultContentType),
      returnValueForMissingStub: null);
  @override
  bool get followRedirects => (super
          .noSuchMethod(Invocation.getter(#followRedirects), returnValue: false)
      as bool);
  @override
  set followRedirects(bool? _followRedirects) =>
      super.noSuchMethod(Invocation.setter(#followRedirects, _followRedirects),
          returnValueForMissingStub: null);
  @override
  int get maxRedirects =>
      (super.noSuchMethod(Invocation.getter(#maxRedirects), returnValue: 0)
          as int);
  @override
  set maxRedirects(int? _maxRedirects) =>
      super.noSuchMethod(Invocation.setter(#maxRedirects, _maxRedirects),
          returnValueForMissingStub: null);
  @override
  int get maxAuthRetries =>
      (super.noSuchMethod(Invocation.getter(#maxAuthRetries), returnValue: 0)
          as int);
  @override
  set maxAuthRetries(int? _maxAuthRetries) =>
      super.noSuchMethod(Invocation.setter(#maxAuthRetries, _maxAuthRetries),
          returnValueForMissingStub: null);
  @override
  set defaultDecoder(_i2.Decoder<dynamic>? _defaultDecoder) =>
      super.noSuchMethod(Invocation.setter(#defaultDecoder, _defaultDecoder),
          returnValueForMissingStub: null);
  @override
  Duration get timeout => (super.noSuchMethod(Invocation.getter(#timeout),
      returnValue: _FakeDuration_4()) as Duration);
  @override
  set timeout(Duration? _timeout) =>
      super.noSuchMethod(Invocation.setter(#timeout, _timeout),
          returnValueForMissingStub: null);
  @override
  set trustedCertificates(List<_i2.TrustedCertificate>? _trustedCertificates) =>
      super.noSuchMethod(
          Invocation.setter(#trustedCertificates, _trustedCertificates),
          returnValueForMissingStub: null);
  @override
  set findProxy(String Function(Uri)? _findProxy) =>
      super.noSuchMethod(Invocation.setter(#findProxy, _findProxy),
          returnValueForMissingStub: null);
  @override
  bool get withCredentials => (super
          .noSuchMethod(Invocation.getter(#withCredentials), returnValue: false)
      as bool);
  @override
  set withCredentials(bool? _withCredentials) =>
      super.noSuchMethod(Invocation.setter(#withCredentials, _withCredentials),
          returnValueForMissingStub: null);
  @override
  List<_i2.GetSocket> get sockets =>
      (super.noSuchMethod(Invocation.getter(#sockets),
          returnValue: <_i2.GetSocket>[]) as List<_i2.GetSocket>);
  @override
  _i2.GetHttpClient get httpClient =>
      (super.noSuchMethod(Invocation.getter(#httpClient),
          returnValue: _FakeGetHttpClient_5()) as _i2.GetHttpClient);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  set sockets(List<_i2.GetSocket>? _sockets) =>
      super.noSuchMethod(Invocation.setter(#sockets, _sockets),
          returnValueForMissingStub: null);
  @override
  _i2.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i2.InternalFinalCallback<void>);
  @override
  _i2.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i2.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<_i2.Response<T>> get<T>(String? url,
          {Map<String, String>? headers,
          String? contentType,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                url
              ], {
                #headers: headers,
                #contentType: contentType,
                #query: query,
                #decoder: decoder
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i7.Future<_i2.Response<T>> post<T>(String? url, dynamic body,
          {String? contentType,
          Map<String, String>? headers,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder,
          _i2.Progress? uploadProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                url,
                body
              ], {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i7.Future<_i2.Response<T>> put<T>(String? url, dynamic body,
          {String? contentType,
          Map<String, String>? headers,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder,
          _i2.Progress? uploadProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                url,
                body
              ], {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i7.Future<_i2.Response<T>> patch<T>(String? url, dynamic body,
          {String? contentType,
          Map<String, String>? headers,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder,
          _i2.Progress? uploadProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                url,
                body
              ], {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i7.Future<_i2.Response<T>> request<T>(String? url, String? method,
          {dynamic body,
          String? contentType,
          Map<String, String>? headers,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder,
          _i2.Progress? uploadProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                url,
                method
              ], {
                #body: body,
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i7.Future<_i2.Response<T>> delete<T>(String? url,
          {Map<String, String>? headers,
          String? contentType,
          Map<String, dynamic>? query,
          _i2.Decoder<T>? decoder}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                url
              ], {
                #headers: headers,
                #contentType: contentType,
                #query: query,
                #decoder: decoder
              }),
              returnValue: Future<_i2.Response<T>>.value(_FakeResponse_7<T>()))
          as _i7.Future<_i2.Response<T>>);
  @override
  _i2.GetSocket socket(String? url,
          {Duration? ping = const Duration(seconds: 5)}) =>
      (super.noSuchMethod(Invocation.method(#socket, [url], {#ping: ping}),
          returnValue: _FakeGetSocket_8()) as _i2.GetSocket);
  @override
  _i7.Future<_i2.GraphQLResponse<T>> query<T>(String? query,
          {String? url,
          Map<String, dynamic>? variables,
          Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#query, [query],
                  {#url: url, #variables: variables, #headers: headers}),
              returnValue: Future<_i2.GraphQLResponse<T>>.value(
                  _FakeGraphQLResponse_9<T>()))
          as _i7.Future<_i2.GraphQLResponse<T>>);
  @override
  _i7.Future<_i2.GraphQLResponse<T>> mutation<T>(String? mutation,
          {String? url,
          Map<String, dynamic>? variables,
          Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#mutation, [mutation],
                  {#url: url, #variables: variables, #headers: headers}),
              returnValue: Future<_i2.GraphQLResponse<T>>.value(
                  _FakeGraphQLResponse_9<T>()))
          as _i7.Future<_i2.GraphQLResponse<T>>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void onClose() => super.noSuchMethod(Invocation.method(#onClose, []),
      returnValueForMissingStub: null);
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
}
