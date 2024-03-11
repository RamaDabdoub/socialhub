import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? boxsize;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.boxsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      height:boxsize?? screenWidth(1.5 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.graydarkColor.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: TextStyle(color: AppColors.blackColor),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.blackColor.withOpacity(0.3),
            fontSize: screenWidth(25),
          ),
          contentPadding: EdgeInsetsDirectional.only(start: screenWidth(30),top: screenWidth(30)),
          fillColor: AppColors.whiteColor,
          filled: true,
          errorStyle: TextStyle(
              color: AppColors.greenColor, fontSize: screenWidth(24)),
        ),
      ),
    );
  }
}
