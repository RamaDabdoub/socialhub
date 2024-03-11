import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/data/models/post_photo_model.dart';
import 'package:empty_code/core/data/repositry/post_photo_repositry.dart';
import 'package:get/get.dart';

class DetailsPostController extends GetxController {
  final int postId;
  RxBool is_loading = true.obs;
  RxList<PostPhotoModel> allphoto = <PostPhotoModel>[].obs;
  DetailsPostController({required this.postId});

  void onInit() async {
   await fetchPhotos();
    super.onInit();
  }

  fetchPhotos() async {
    allphoto.clear();
    await PhotoRepository().getAllPostPhoto(postId: postId).then((value) {
      value.fold((l) => BotToast.showText(text: l), (r) =>

       allphoto.addAll(r)
       );
    });
  }
}
