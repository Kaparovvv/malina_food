import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class InfoBoxWidget extends StatelessWidget {
  final List<Widget> listWidgets;
  const InfoBoxWidget({
    Key? key,
    required this.listWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: ThemeHelper.white,
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.shadowBox1,
            offset: const Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 15.w, top: 25.h, right: 15.w, bottom: 25.h),
        child: Column(
          children: listWidgets,
        ),
      ),
    );
  }
}
