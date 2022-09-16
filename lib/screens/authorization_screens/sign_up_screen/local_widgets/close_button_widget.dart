import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class CloseButtonWidget {
  AppBar closeButton(Function() onPressed) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            onPressed: () => onPressed(),
            icon: Icon(
              Icons.close,
              size: 25,
              color: ThemeHelper.greyDial,
            ),
          ),
        ),
      ],
    );
  }
}
