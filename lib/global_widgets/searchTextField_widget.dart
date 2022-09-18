import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final Color fillColor;
  const SearchTextFieldWidget({
    Key? key,
    required this.controller,
    required this.width,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 35.h,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.5),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          filled: true,
          fillColor: fillColor,
          prefixIcon: ImageIcon(
            AssetImage(IconHelper.searchIcon),
            size: 16,
            color: ThemeHelper.greyDial,
          ),
          hintText: 'Поиск',
          hintStyle: TextStyleHelper.hintTextSearch,
        ),
      ),
    );
  }
}
