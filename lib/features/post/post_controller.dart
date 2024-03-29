import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/post/data/post_create_request.dart';
import 'package:microblog/features/post/data/post_parameters.dart';
import 'package:microblog/features/post/data/post_update_request.dart';
import 'package:microblog/features/post/post_create_use_case.dart';
import 'package:microblog/features/post/post_delete_use_case.dart';
import 'package:microblog/features/post/post_update_use_case.dart';

class PostController extends BaseController<PostParameters> {
  late final TextEditingController textPostController;

  int? currentUserId;
  final IStorage storage;
  final PostCreateUseCase postCreateUseCase;
  final PostUpdateUseCase postUpdateUseCase;
  final PostDeleteUseCase postDeleteUseCase;

  PostController({
    required IRouter router,
    required this.storage,
    required this.postCreateUseCase,
    required this.postUpdateUseCase,
    required this.postDeleteUseCase,
  }) : super(router: router);

  @override
  onInit() {
    textPostController = TextEditingController(
      text: parameters?.post?.message ?? '',
    );
    super.onInit();
  }

  @override
  void onReady() async {
    currentUserId = await storage.getUserId();
    super.onReady();
  }

  @override
  onClose() {
    textPostController.dispose();
    super.onClose();
  }

  Future<void> createPost() async {
    (await postCreateUseCase(
      data: PostCreateRequest(
        userId: currentUserId ?? 0,
        message: textPostController.text.trim(),
        date: DateTime.now().toIso8601String(),
      ),
    ))
        .fold(
      (l) => router.showSnackbarError(message: l.cause),
      (r) async {
        await router.goBack(closeOverlays: true);
        router.showSnackbarSuccess(message: 'message_post_created'.tr);
      },
    );
  }

  Future<void> updatePost() async {
    (await postUpdateUseCase(
      data: PostUpdateRequest(
        postId: parameters?.post?.id ?? 0,
        userId: currentUserId ?? 0,
        message: textPostController.text.trim(),
        date: DateTime.now().toIso8601String(),
      ),
    ))
        .fold(
      (l) => router.showSnackbarError(message: l.cause),
      (r) async {
        await router.goBack(closeOverlays: true);
        router.showSnackbarSuccess(message: 'message_post_updated'.tr);
      },
    );
  }

  Future<void> deletePost() async {
    (await postDeleteUseCase(
      id: parameters?.post?.id ?? 0,
    ))
        .fold(
      (l) => router.showSnackbarError(message: l.cause),
      (r) async {
        await router.goBack(closeOverlays: true);
        router.showSnackbarSuccess(message: 'message_post_deleted'.tr);
      },
    );
  }
}
