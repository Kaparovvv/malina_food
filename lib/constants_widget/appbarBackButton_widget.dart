import 'package:flutter/material.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class AppBarBackButtonWidget {
  AppBar appBar(
    String title,
    Color color,
    Function() onTabLeading,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
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
        title,
        style: TextStyleHelper.f20w700.copyWith(
          color: ThemeHelper.blackDial,
        ),
      ),
    );
  }
}
