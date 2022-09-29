import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/buttonCrimson_widget.dart';

class ShowDialogWidget extends StatelessWidget {
  final Function() buttonOnPressed;
  final Function() iconOnPressed;

  final String contentText;
  final String buttonText;
  final EdgeInsets contentPadding;
  final EdgeInsets buttonPadding;
  const ShowDialogWidget({
    super.key,
    required this.buttonOnPressed,
    required this.contentText,
    required this.buttonText,
    required this.contentPadding,
    required this.buttonPadding, required this.iconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: contentPadding,
      content: Text(
        contentText,
        textAlign: TextAlign.center,
        style: TextStyleHelper.f20w500.copyWith(color: ThemeHelper.blackDial),
      ),
      iconPadding: EdgeInsets.only(left: 250.w, right: 18.w, top: 20.h),
      icon: IconButton(
        onPressed: () => iconOnPressed(),
        icon: Icon(
          Icons.close_outlined,
          color: ThemeHelper.greyDial,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: buttonPadding,
          child: ButtonCrimsonWidget(
            txtButton: buttonText,
            width: 198,
            height: 45,
            onPressed: () => buttonOnPressed(),
            textStyle:
                TextStyleHelper.f14w500.copyWith(color: ThemeHelper.white),
          ),
        ),
      ],
    );
  }
}
