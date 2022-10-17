import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class BoxShadowHelper {
  static BoxShadow rgb135 = BoxShadow(
    color: ThemeHelper.rgb135,
    offset: const Offset(0, 2),
    blurRadius: 20.r,
  );

  static BoxShadow white50 = BoxShadow(
    color: ThemeHelper.shadowBox1,
    offset: const Offset(0, 2),
    blurRadius: 20.r,
  );

  static BoxShadow blurRadius15 = BoxShadow(
    color: ThemeHelper.rgb135,
    offset: const Offset(0, 2),
    blurRadius: 15.r,
  );

  static BoxShadow mainIconShadow = BoxShadow(
    color: ThemeHelper.rgb170,
    offset: const Offset(0, 0),
    blurRadius: 10.r,
  );

  static BoxShadow rgb159 = BoxShadow(
    color: ThemeHelper.rgb159,
    offset: const Offset(0, 4),
    blurRadius: 15.r,
  );
}
