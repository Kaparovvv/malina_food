import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/buttonCrimson_widget.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.only(top: 16.h, bottom: 15.h),
      content: Text(
        'Скоро будет доступно',
        textAlign: TextAlign.center,
        style: TextStyleHelper.f20w500.copyWith(color: ThemeHelper.blackDial),
      ),
      iconPadding: EdgeInsets.only(left: 250.w, right: 18.w, top: 20.h),
      icon: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.close_outlined,
          color: ThemeHelper.greyDial,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: ButtonCrimsonWidget(
            txtButton: 'Хорошо',
            width: 198,
            height: 45,
            onPressed: () => Navigator.pop(context),
            textStyle: TextStyleHelper.f14w500.copyWith(color: ThemeHelper.white),
          ),
        ),
      ],
    );
  }
}
