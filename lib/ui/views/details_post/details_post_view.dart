import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_container_post.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_gradient.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_shimmer.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/details_post/details_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DetailsPost extends StatefulWidget {
  final PostModel post;
  const DetailsPost({super.key, required this.post});

  @override
  State<DetailsPost> createState() => _DetailsPostState();
}

class _DetailsPostState extends State<DetailsPost> {
  // DetailsPostController controller = Get.put(DetailsPostController(postId: widget.post.id??0 ));

  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<DetailsPostController>(
      init: DetailsPostController(postId: widget.post.id ?? 0),
      builder: (controller) =>
         SafeArea(
           child: Scaffold(
               body: customGradient(
            child: ListView(
            physics: NeverScrollableScrollPhysics(),
                 padding: EdgeInsetsDirectional.only(
              start: screenWidth(20), top: screenWidth(10), end: screenWidth(20)),
                 children: [
            CustomPost(post: widget.post),
            SizedBox(
              height: screenWidth(30),
            ),
            Customtext(
              text: 'Album:',
              styleType: TextStyleType.SUBTITLE,
              textColor: AppColors.greenColor,
            ),
            SizedBox(
              height: screenWidth(30),
            ),
            Obx(
              () => controller.is_loading.value && controller.allphoto.isEmpty
                  ?  ShimmerLoading()
                  : Container(
                    height: screenWidth(0.2),
                    child: ListView.builder(
                     
                     
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.allphoto.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:EdgeInsetsDirectional.only(bottom: screenWidth(20)),
                            child: Image.network(
                                                  
                              controller.allphoto[index].url ?? '',
                              width: screenWidth(1),
                              height: screenWidth(2),
                              fit: BoxFit.cover,
                            ),
                          );
                          
                        },
                      ),
                  ),
            )
                    
                 ],
               )),
             ),
         ));
  }
}
