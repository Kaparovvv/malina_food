import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';

class SubcategoriesAppBar {
  AppBar appBar(String title, Function() onTabLeading, Function() onTabAction) {
    return AppBar(
      elevation: 0,
      backgroundColor: ThemeHelper.rgb239,
      leading: IconButton(
        splashColor: ThemeHelper.blackDial,
        onPressed: () => onTabLeading(),
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ThemeHelper.blackDial,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Еда',
        style: TextStyleHelper.f20w700.copyWith(
          color: ThemeHelper.blackDial,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 13.w),
          child: InkWell(
            onTap: () => onTabAction(),
            splashColor: ThemeHelper.greyDial,
            child: Ink(
              width: 30.w,
              height: 30.h,
              child: Image.asset(
                WidgetState.isNotify
                    ? IconHelper.notifyTrueCont
                    : IconHelper.notifyFalseCont,
              ),
            ),
          ),
        ),
      ],
    );
  }
}