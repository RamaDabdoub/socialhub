import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
   final bool shouldShowShimmer;
   final double? height;

  const ShimmerLoading({super.key,  this.shouldShowShimmer= true, this.height});
   
  @override
  Widget build(BuildContext context) {
     if (!shouldShowShimmer) {
      return SizedBox.shrink(); // If shouldShowShimmer is false, return an empty sized box
    }
    return Container(
       width: double.infinity,
      height: screenWidth(0.22),
      child: ListView.builder(
         physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return 
            Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 207, 207, 207),
              highlightColor: Color.fromARGB(255, 209, 209, 209),
                child: Container(
                  height:height?? screenWidth(2),
                    margin:EdgeInsetsDirectional.only(bottom: screenWidth(20)),
                    constraints: BoxConstraints(
                        maxWidth: screenWidth(2.1), minWidth: screenWidth(5)),
                    decoration: BoxDecoration(
                        color: AppColors.graylightColor,
                        border: Border.all(
                            width: screenWidth(5),
                            color: AppColors.graylightColor),
                        borderRadius: BorderRadius.circular(screenWidth(30))))
                        );
          }),
    );
  }
}