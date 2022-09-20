import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/main_screens/institution_screen/local_widgets/availablePaymentPointsButton_widget.dart';
import 'package:malina_app/screens/main_screens/institution_screen/local_widgets/infoBoxInstitution_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';

class InstitutionScreen extends StatefulWidget {
  final String institutionName;
  final String typeInstitution;
  final String? imageUrl;
  const InstitutionScreen({
    super.key,
    required this.imageUrl,
    required this.institutionName,
    required this.typeInstitution,
  });

  @override
  State<InstitutionScreen> createState() => _InstitutionScreenState();
}

class _InstitutionScreenState extends State<InstitutionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SubcategoriesAppBar().appBar(
        'Еда',
        Colors.transparent,
        () => Navigator.pop(context),
        () {
          setState(() {
            WidgetState.isNotify = !WidgetState.isNotify;
          });
        },
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomCachedNetworkImage(
                    imageUrl: widget.imageUrl!,
                    width: 1.sw,
                    height: 355.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: Column(
                        children: [
                          AvailablePaymentPointsButton(
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Акции',
                                  style: TextStyleHelper.f14w700
                                      .copyWith(color: ThemeHelper.blackDial),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  width: 1.sw,
                                  height: 88.h,
                                  child: ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) =>
                                        const StocksBoxWidget(
                                      heading: 'Скидка 25%',
                                      text: 'на первый заказ',
                                      linearGradient: [
                                        Color(0xff9620CE),
                                        Color(0xffFF89A6),
                                      ],
                                    ),
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(width: 10.w);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 25.h, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RedrawButtonWidget(
                                  isActive: WidgetState.isActive,
                                  onPressed: () {
                                    setState(() {
                                      WidgetState.isActive = true;
                                      WidgetState.isNotActive = false;
                                    });
                                  },
                                  title: 'Контакты',
                                ),
                                RedrawButtonWidget(
                                  isActive: WidgetState.isNotActive,
                                  onPressed: () {
                                    setState(() {
                                      WidgetState.isActive = false;
                                      WidgetState.isNotActive = true;
                                    });
                                  },
                                  title: 'Отзывы',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Material(
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(20.r),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: ThemeHelper.yellow,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                      horizontal: 10.w,
                                    ),
                                    child: Text(
                                      'Бронировать стол',
                                      style: TextStyleHelper.f14w400.copyWith(
                                        color: ThemeHelper.blackDial,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 295.h,
                left: 15.w,
                right: 15.w,
                child: InfoBoxInstitutionWidget(
                  institutionName: widget.institutionName,
                  typeInstitution: widget.typeInstitution,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StocksBoxWidget extends StatelessWidget {
  final String? heading;
  final String? text;
  final List<Color> linearGradient;

  const StocksBoxWidget({
    Key? key,
    this.heading,
    this.text,
    required this.linearGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.w,
      height: 88.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: linearGradient,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 13.h,
          horizontal: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyleHelper.f16w700.copyWith(color: ThemeHelper.white),
            ),
            Text(
              text!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyleHelper.f12w500.copyWith(color: ThemeHelper.white),
            ),
          ],
        ),
      ),
    );
  }
}

class RedrawButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final bool isActive;
  const RedrawButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(10.r),
        child: Ink(
          width: 155.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: isActive ? ThemeHelper.yellow : ThemeHelper.white,
            borderRadius: BorderRadius.circular(10.r),
            border: isActive
                ? const Border()
                : Border.all(color: ThemeHelper.bejGray),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyleHelper.f16w500
                  .copyWith(color: ThemeHelper.blackDial),
            ),
          ),
        ),
      ),
    );
  }
}
