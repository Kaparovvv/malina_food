import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class WidgetsHelpers {
  ImageIcon imageIcon(String imageName, double size, Color color) {
    return ImageIcon(
      AssetImage(imageName),
      size: size,
      color: color,
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
}
