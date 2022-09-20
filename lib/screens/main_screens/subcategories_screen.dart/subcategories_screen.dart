import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/main_screens/institution_screen/institution_screen.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/containerInstitution_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/section_button_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';

class SubcategoriesScreen extends StatefulWidget {
  final String? imageUrl;
  const SubcategoriesScreen({super.key, this.imageUrl});

  @override
  State<SubcategoriesScreen> createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
  // String imageUrl =
  //     'https://avatars.mds.yandex.net/i?id=ea1e5c300a5b2113c54e76094922d221-4550834-images-thumbs&n=13';
  String institutionName = 'Munchen Pub';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubcategoriesAppBar().appBar(
        'Еда',
        ThemeHelper.rgb239,
        () => Navigator.pop(context),
        () {
          setState(() {
            WidgetState.isNotify = !WidgetState.isNotify;
          });
        },
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: ThemeHelper.rgb239,
        child: Padding(
          padding: EdgeInsets.only(top: 18.h, left: 7.w, right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchTextFieldWidget(
                  controller: TextEditingController(),
                  fillColor: ThemeHelper.white,
                  width: 334,
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 495.h,
                      child: ListView.separated(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return SectionButtonWidget(
                            onPressed: () {},
                            sectionName: 'Рестораны',
                            iconUrl: IconHelper.restaurent,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5.h);
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 245.w,
                      height: 495.h,
                      child: ListView.separated(
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5.h);
                        },
                        itemBuilder: (context, index) {
                          return ContainerInstitutionWidget(
                            imageUrl: widget.imageUrl!,
                            nameInstitution: 'Мюнхен Паб',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InstitutionScreen(
                                  imageUrl: widget.imageUrl!,
                                  institutionName: institutionName,
                                  typeInstitution: 'Bar',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
