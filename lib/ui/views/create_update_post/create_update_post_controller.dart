import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/data/repositry/post_repositry.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/views/home_post/home_allpost.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateUpdatePostController extends GetxController {
  RxBool isUpdate = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PostModel? post;

  CreateUpdatePostController(this.post) {
    if (post != null) {
      isUpdate.value = true;
      titleController.text = post!.title ?? '';
      bodyController.text = post!.body ?? '';
    }
  }

  void onInit() {
    //  isUpdate.value=widget.post == null;

    super.onInit();
  }

  void submitForm() {
    if (isUpdate.value) {
      _updatePost();
    } else {
      _createPost();
    }
  }

  void _updatePost() {
    if (post != null) {
      PostRepository()
          .UpdatePost(
        title: titleController.text,
        body: bodyController.text,
        postId: post!.id ?? 0,
      )
          .then((value) {
        value.fold(
            (l) => BotToast.showText(text: l),
            (r) => {
               titleController.clear(),
          bodyController.clear(),
                  BotToast.showText(
                    text: 'Update successful',
                    duration: Duration(seconds: 3),
                    contentPadding: EdgeInsets.all(15),
                    textStyle:
                        TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                    contentColor: AppColors.greenColor,
                  ),
                  Get.to(PostHome())!.then((value) =>
                      {titleController.clear(), bodyController.clear()})
                });
      });
    }
  }

  void _createPost() {
    PostRepository()
        .CreatPost(
      title: titleController.text,
      body: bodyController.text,
    )
        .then((value) {
      value.fold(
          (l) => BotToast.showText(text: l),
          (r) => {
                BotToast.showText(
                  text: 'Create successful',
                  duration: Duration(seconds: 3),
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                  contentColor: AppColors.greenColor,
                ),
                Get.to(PostHome())
              });
    });
  }
}
