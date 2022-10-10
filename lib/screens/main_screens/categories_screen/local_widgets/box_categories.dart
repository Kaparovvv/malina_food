import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/show_dialog_widget.dart';

class BoxCategories extends StatelessWidget {
  final String? categoriesName;
  final String? imageUrl;
  final int? available;
  final Function() onTab;

  const BoxCategories({
    Key? key,
    required this.categoriesName,
    required this.imageUrl,
    this.available = 0,
    required this.onTab(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => available == 1
          ? onTab()
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDialogWidget(
                  contentText: 'Скоро будет доступно',
                  buttonText: 'Хорошо',
                  buttonOnPressed: () => Navigator.pop(context),
                  iconOnPressed: () => Navigator.pop(context),
                  contentPadding: EdgeInsets.only(top: 16.h, bottom: 15.h),
                  buttonPadding: EdgeInsets.only(bottom: 40.h),
                );
              },
            ),
      child: Stack(
        children: [
          Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: imageUrl,
                width: 94,
                height: 94,
                borderRadius: BorderRadius.circular(5.r),
              ),
              Positioned(
                left: 9.w,
                top: 9.h,
                right: 9.w,
                child: Text(
                  categoriesName ?? 'unknown',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f12w500
                      .copyWith(color: ThemeHelper.white),
                ),
              ),
            ],
          ),
          available == 1
              ? const SizedBox()
              : Container(
                  width: 94.w,
                  height: 94.h,
                  color: ThemeHelper.white.withOpacity(0.7),
                ),
        ],
      ),
    );
  }
}
