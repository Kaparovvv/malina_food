import 'package:flutter/material.dart';

class WidgetsHelpers {
  ImageIcon imageIcon(String imageName, double size, Color color) {
    return ImageIcon(
      AssetImage(imageName),
      size: size,
      color: color,
    );
  }
}
