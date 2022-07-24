import 'package:flutter/cupertino.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/post/data/post_create_request.dart';
import 'package:microblog/features/post/data/post_parameters.dart';
import 'package:microblog/features/post/post_create_use_case.dart';

class PostController extends BaseController<PostParameters> {
  late final TextEditingController textPostController;

  late final int currentUserId;
  final Storage storage;
  final PostCreateUseCase postCreateUseCase;

  PostController({
    required IRouter router,
    required this.storage,
    required this.postCreateUseCase,
  }) : super(router: router);

  @override
  onInit() {
    textPostController = TextEditingController();
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

  Future<void> save() async {
    (await postCreateUseCase(
      data: PostCreateRequest(
        userId: currentUserId,
        message: textPostController.text.trim(),
      ),
    ))
        .fold(
      (l) => showSnackbarError(message: l.cause),
      (r) async {
        await router.goBack();
        showSnackbarSuccess(message: 'Post created');
      },
    );
  }
}
