import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class Customtext extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final TextOverflow? overFlow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;

  const Customtext({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor = Colors.white,
    this.fontWeight,
    this.fontSize, this.overFlow, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text,
      style: getStyle(size),
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize: screenWidth(12),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
            fontSize: screenWidth(15),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize: screenWidth(28),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
            fontSize: screenWidth(35),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
            fontSize: size.width / 28,
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
