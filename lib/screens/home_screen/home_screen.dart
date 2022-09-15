import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/circle_cached_network_image.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/home_screen/local_widgets/userBox_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 39.h,
          ),
          child: Column(
            children: [
              UserBoxWidget(
                imageUrl: ImageHelper.userPhoto,
                // imageUrl: 'https://yandex.ru/images/search?text=ana+de+armas&img_url=http%3A%2F%2Fon-desktop.com%2Fwps%2F2020_Smiling_actress_Ana_de_Armas_on_a_gray_background_141645_.jpg&pos=8&rpt=simage&stype=image&lr=10309&parent-reqid=1663224842276237-8231058883730267249-sas3-0878-e73-sas-l7-balancer-8080-BAL-1591&source=serp',
                userName: 'Екатерина',
                boxTab: () {},
                notifyTab: () {},
              ),
              SizedBox(height: 19.h),
              SerchTextFieldWidget(
                width: 302,
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

