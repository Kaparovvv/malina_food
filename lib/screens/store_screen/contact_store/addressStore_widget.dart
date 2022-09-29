import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class AddressStoresWidget extends StatelessWidget {
  final Map<String, dynamic>? infoListOfStore;
  const AddressStoresWidget({super.key, required this.infoListOfStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _iconAndText(IconHelper.locationStore,
            '${infoListOfStore!['city']}, ${infoListOfStore!['name']}'),
        SizedBox(height: 15.h),
        _iconAndText(
          IconHelper.timeIcon,
          infoListOfStore!['worktime'],
        ),
        SizedBox(height: 15.h),
        _iconAndText(
          IconHelper.callIcon,
          infoListOfStore!['phone'],
        ),
        SizedBox(height: 15.h),
        _messengerIcon(
          IconHelper.whatsapp,
          infoListOfStore!['whatsapp'],
          () {},
        ),
        SizedBox(height: 10.w),
        _messengerIcon(
          IconHelper.telegram,
          infoListOfStore!['telegram'],
          () {},
        ),
        SizedBox(height: 10.w),
        _messengerIcon(
          IconHelper.instagram,
          infoListOfStore!['instagram'],
          () {},
        ),
      ],
    );
  }

  Widget _messengerIcon(String iconName, String text, Function() onPressed) {
    return InkWell(
      onTap: onPressed(),
      child: Row(
        children: [
          Image.asset(
            iconName,
            width: 27.w,
            height: 27.h,
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 300.w,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyleHelper.f14w500.copyWith(
                color: ThemeHelper.blackDial,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconAndText(String iconName, String text) {
    return Row(
      children: [
        _iconBox(iconName),
        SizedBox(width: 10.w),
        SizedBox(
          width: 300.w,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.f14w500.copyWith(
              color: ThemeHelper.blackDial,
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconBox(String iconName) {
    return Container(
      width: 19.w,
      height: 19.h,
      decoration: BoxDecoration(
        color: ThemeHelper.colorF8F7FA,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: WidgetsHelpers().imageIcon(
          iconName,
          14,
          ThemeHelper.black,
        ),
      ),
    );
  }
}
