import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/data/repositry/post_repositry.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_toast.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/create_update_post/create_update_post_view.dart';
import 'package:get/get.dart';


class PostsController extends GetxController {
   RxBool is_loading = true.obs;
  RxList<PostModel> allPost = <PostModel>[].obs;
  @override
  void onInit() async {
await getAllPosts();
super.onInit();
  }



creatpost(){
  Get.to(CreatUpdatePostView());
}

  getAllPosts() async{
    is_loading.value = true;
    if(isOnline)
  { await PostRepository().getAllPost()
  .then((value) {
    value.fold((l) => BotToast.showText(text: l), (r) {
      allPost.addAll(r);
    });
  });}
  else {
      CustomToast.showMeassge(message: "There is no intrent");
    }
    is_loading.value = false;
  }



    refreshPage() async {
    if (isOnline) {
      
      is_loading.value = true;
      await getAllPosts();
      
      
      is_loading.value = false;
      
      
    } else {
     
       is_loading.value = true;
       allPost.clear();
      await Future.delayed(Duration(seconds: 2)); 
   
      is_loading.value = false;
      // CustomToast.showMeassge(message: "There is no intrent");
    }
  }
}
