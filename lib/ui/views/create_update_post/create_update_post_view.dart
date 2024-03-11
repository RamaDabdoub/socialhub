import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_gradient.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/create_update_post/create_update_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatUpdatePostView extends StatefulWidget {
  final PostModel? post;
  const CreatUpdatePostView({super.key, this.post});

  @override
  State<CreatUpdatePostView> createState() => _CreatUpdatePostViewState();
}

class _CreatUpdatePostViewState extends State<CreatUpdatePostView> {
 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateUpdatePostController>(
      init: CreateUpdatePostController(widget.post),
      builder: (controller) => SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: InkWell(
          onTap: () {
            controller.submitForm();
          },
          child: Container(
            width: screenWidth(1.2),
            height: screenWidth(7),
            margin: EdgeInsetsDirectional.only(
                start: screenWidth(20), end: screenWidth(20)),
            decoration: BoxDecoration(
                color: AppColors.terkwazColor,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Obx(
                () => Customtext(
                  text: controller.isUpdate.value ? 'Update' : 'Save',
                  styleType: TextStyleType.CUSTOM,
                  fontSize: screenWidth(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        body: customGradient(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(10),
                start: screenWidth(15),
                end: screenWidth(15)),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/pngs/socialhub.png',
                      width: screenWidth(1.8),
                      height: screenWidth(3.6),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth(6),
                  ),
                  Customtext(
                    text:  controller.isUpdate.value?'Update Post':'Add new Post',
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                 

                  CustomTextField(
                    boxsize: screenWidth(5),
                    hintText: 'Title',
                    controller: controller.titleController,
                    validator: (value) {},
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),

                  CustomTextField(
                    hintText: 'Body',
                    controller: controller.bodyController,
                    validator: (value) {},
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
