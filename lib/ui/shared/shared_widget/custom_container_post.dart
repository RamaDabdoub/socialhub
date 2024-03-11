import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/data/repositry/post_repositry.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/create_update_post/create_update_post_view.dart';
import 'package:empty_code/ui/views/home_post/home_allpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPost extends StatelessWidget {
  final PostModel post;
  final SizedBox? sizebox;
  // final IconData? icondelete;
  // final IconData? iconedit;
  const CustomPost({
    super.key,
    //  this.icondelete, this.iconedit,
    this.sizebox,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      margin: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
      padding: EdgeInsets.all(screenWidth(30)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: screenWidth(1.44)),
            child: sizebox ??
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(CreatUpdatePostView(
                          post: post,
                        ));
                      },
                      child: Icon(
                        Icons.edit,
                        size: 27,
                      ),
                    ),
                    InkWell(
                      onTap: ()async {
                      await  PostRepository()
                            .DeletePost(postId: post.id ?? 0)
                            .then((value) {
                          value.fold((l) {
                            BotToast.showText(text: l);
                          }, (r) {
                            BotToast.showText(
                              text: 'Delete successfully',
                              duration: Duration(seconds: 3),
                              contentPadding: EdgeInsets.all(15),
                              textStyle: TextStyle(
                                  fontSize: 13.5, color: AppColors.whiteColor),
                              contentColor: AppColors.greenColor,
                            );
                            Get.to(PostHome(
                             
                            ));
                          });
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        size: 27,
                        color: AppColors.redColor,
                      ),
                    ),
                  ],
                ),
          ),
          Customtext(
            text: post.title ?? '',
            textColor: AppColors.greenColor,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 10,
          ),
          Customtext(
            text: post.body ?? '',
            textColor: AppColors.blackColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(32),
          ),
          // Row(
          //   children: [
          //     Icon(icondelete,size: 27,color: AppColors.redColor,),
          //     Icon(iconedit,size: 27,color: AppColors.terkwazColor,)
          //   ],
          // )
        ],
      ),
    );
  }
}
