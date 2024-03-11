import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_container_post.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_gradient.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_shimmer.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/details_post/details_post_view.dart';
import 'package:empty_code/ui/views/home_post/home_allpost_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostHome extends StatefulWidget {
  const PostHome({super.key});

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  PostsController controller = Get.put(PostsController());
    RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: customGradient(
                child: SmartRefresher(
                    enablePullDown: true,
          controller: refreshController,
          header: WaterDropHeader(waterDropColor: AppColors.greenColor),
          onRefresh: () async {
            await controller.refreshPage();
            refreshController.refreshCompleted();
          },
                  child: ListView(
                    padding: EdgeInsetsDirectional.only(
                            top: screenWidth(40), start: screenWidth(20), end: screenWidth(20)),
                    children: [
                      InkWell(
                            onTap: () {
                              controller.creatpost();
                            },
                            child: SvgPicture.asset(
                              alignment: AlignmentDirectional.centerEnd,
                              'assets/images/svgs/create-note-svgrepo-com.svg',
                              width: screenWidth(12),
                            ),
                      ),
                      Center(
                            child: Image.asset(
                              'assets/images/pngs/socialhub.png',
                              width: screenWidth(1.8),
                              height: screenWidth(3.6),
                            ),
                      ),
                      SizedBox(
                            height: screenWidth(12),
                      ),
                      Obx(() => controller.is_loading.value 
                              ? ShimmerLoading(height: screenWidth(3),)
                   
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.allPost.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Get.to(
                                    DetailsPost(post: controller.allPost[index]));
                              },
                              child: CustomPost(
                                post: controller.allPost[index],
                                sizebox: SizedBox(),
                              ));
                        },
                      )),
                     
                    ],
                  ),
                ),
              )));
  }
}
