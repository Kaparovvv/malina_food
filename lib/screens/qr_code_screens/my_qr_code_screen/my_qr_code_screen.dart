import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';
import 'package:malina_app/screens/qr_code_screens/my_qr_code_screen/local_widgets/frameQrCode_widget.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/local_widgets/qrScannerOverlay_widget.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/qr_code_scanner_screen.dart';

class MyQrCodeScreen extends StatelessWidget {
  const MyQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400.w ||
            MediaQuery.of(context).size.height < 400.h)
        ? 200.0.h
        : 330.0.w;
    return Scaffold(
      appBar: CloseButtonWidget().closeButton(
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QrCodeScannerScreen(),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 221.w,
              height: 42.h,
              child: Text(
                'Ваш персональный QR-код для начисления баллов',
                textAlign: TextAlign.center,
                style: TextStyleHelper.f18w400.copyWith(
                  color: ThemeHelper.black,
                ),
              ),
            ),
            SizedBox(height: 21.h),
            SizedBox(
              width: 304.w,
              height: 320.h,
              child: Stack(
                children: [
                  Container(
                    width: 304.w,
                    height: 320.h,
                    decoration: BoxDecoration(
                      color: ThemeHelper.white,
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeHelper.black25,
                          offset: const Offset(0, 0),
                          blurRadius: 40.r,
                          spreadRadius: 0.r,
                        )
                      ],
                    ),
                    child: Center(
                      child: CustomCachedNetworkImage(
                        height: 216.h,
                        width: 216.w,
                        imageUrl:
                            'https://nashaplaneta.su/_bl/309/14217938.png',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 39.h,
                    left: 31.w,
                    right: 31.w,
                    bottom: 39.h,
                    child: CustomPaint(
                      foregroundPainter: FrameQrCodeWidget(),
                      child: SizedBox(
                        width: scanArea + -20,
                        height: scanArea + 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 39.h),
            Column(
              children: [
                Text(
                  'Ваши баллы',
                  style: TextStyleHelper.f18w600
                      .copyWith(color: ThemeHelper.black),
                ),
                Text(
                  '1521',
                  style: TextStyleHelper.f24w800.copyWith(
                    color: ThemeHelper.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
