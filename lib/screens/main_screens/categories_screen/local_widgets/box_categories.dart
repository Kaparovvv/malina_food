import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/show_dialog_widget.dart';

class BoxCategories extends StatelessWidget {
  final String? categoriesName;
  final String? imageUrl;
  final bool isAvailable;
  final Function() onTab;

  const BoxCategories({
    Key? key,
    required this.categoriesName,
    required this.imageUrl,
    this.isAvailable = false,
    required this.onTab(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isAvailable
          ? onTab()
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ShowDialogWidget();
              },
            ),
      child: Stack(
        children: [
          Container(
            width: 94.w,
            height: 94.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                image: AssetImage(imageUrl!),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 9.w, top: 9.h, right: 9),
              child: Text(
                categoriesName!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f12w500.copyWith(color: ThemeHelper.white),
              ),
            ),
          ),
          isAvailable
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
