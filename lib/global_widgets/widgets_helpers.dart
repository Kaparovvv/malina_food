import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class WidgetsHelpers {
  ImageIcon imageIcon(String imageName, double size, Color color) {
    return ImageIcon(
      AssetImage(imageName),
      size: size,
      color: color,
    );
  }

  ImageIcon image(String imageName, double size) {
    return ImageIcon(
      AssetImage(imageName),
      size: size,
    );
  }

  ImageIcon imageIconCrimson(String imageName) {
    return ImageIcon(
      AssetImage(imageName),
      size: 24,
      color: ThemeHelper.crimson,
    );
  }

  ImageIcon logoIcon(String imageName) {
    return ImageIcon(
      AssetImage(imageName),
      size: 25,
    );
  }

  Divider divider() {
    return Divider(
      thickness: 1.h,
      color: ThemeHelper.dividerColor,
    );
  }

  Widget valuta(Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'C',
          style: TextStyleHelper.f16w400.copyWith(color: color),
        ),
        Container(
          width: 10.w,
          height: 1.h,
          color: color,
        )
      ],
    );
  }
}
