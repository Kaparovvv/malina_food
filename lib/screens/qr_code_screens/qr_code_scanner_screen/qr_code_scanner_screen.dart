import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/bottomNavigationBar_widget.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/show_dialog_widget.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_bloc.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_event.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/local_widgets/qrScannerOverlay_widget.dart';
import 'package:malina_app/screens/store_screen/store_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({super.key});

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  late MobileScannerController _cameraController;
  bool isScanned = false;

  late ScannerBloc _scannerBloc;


  @override
  void initState() {
    _cameraController = MobileScannerController();
    _scannerBloc = ScannerBloc();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomNavigationBarWidget(),
              ),
            ),
            icon: Icon(
              Icons.close,
              size: 25,
              color: ThemeHelper.greyDial,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 220.h,
            left: 58.w,
            right: 58.w,
            child: Material(
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: MobileScanner(
                  allowDuplicates: false,
                  controller: _cameraController,
                  onDetect: (barcode, args) async {
                    await Future.delayed(const Duration(seconds: 1), () {
                      if (barcode.rawValue == null) {
                        debugPrint('Не удалось отсканировать QR-code');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Не удалось отсканировать QR-code'),
                          ),
                        );
                      } else {
                        Box qrCodeAPIBox = Hive.box('apiBox');
                        qrCodeAPIBox.put('api', barcode.rawValue);
                        log('Store API ====== ${qrCodeAPIBox.get('api')}');
                        setState(() {
                          isScanned = true;
                        });
                        if ({qrCodeAPIBox.get('api')}.isNotEmpty) {
                          _scannerBloc.add(GetScannerEvent());
                        }
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          isScanned
              ? const SizedBox()
              : QRScannerOverlayWidget(
                  overlayColour: ThemeHelper.black70,
                ),
          isScanned
              ? Center(
                  child: ShowDialogWidget(
                    contentText: 'QR-code отсканирован',
                    buttonText: 'Перейти в заведение',
                    contentPadding: EdgeInsets.only(top: 16.h, bottom: 15.h),
                    buttonPadding: EdgeInsets.only(bottom: 16.h),
                    iconOnPressed: () {
                      setState(() {
                        isScanned = false;
                      });
                    },
                    buttonOnPressed: () {
                      // _storeIdBloc.add(StoreIdAfterScannedEvent());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreScreen(),
                        ),
                      );
                    },
                  ),
                )
              : Positioned(
                  top: 94.h,
                  left: 45.w,
                  right: 45.w,
                  child: Column(
                    children: [
                      Text(
                        'Поместите QR-код в рамку',
                        style: TextStyleHelper.f18w400
                            .copyWith(color: ThemeHelper.white),
                      ),
                      SizedBox(height: 380.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable: _cameraController.torchState,
                              builder: (context, state, child) {
                                switch (state as TorchState) {
                                  case TorchState.off:
                                    return WidgetsHelpers().imageIcon(
                                      IconHelper.flashIcon,
                                      24,
                                      ThemeHelper.white,
                                    );
                                  case TorchState.on:
                                    return WidgetsHelpers().imageIcon(
                                      IconHelper.flashIcon,
                                      24,
                                      ThemeHelper.yellow,
                                    );
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => _cameraController.toggleTorch(),
                          ),
                          IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable:
                                  _cameraController.cameraFacingState,
                              builder: (context, state, child) {
                                switch (state as CameraFacing) {
                                  case CameraFacing.front:
                                    return Icon(
                                      Icons.loop_outlined,
                                      color: ThemeHelper.crimson,
                                    );
                                  case CameraFacing.back:
                                    return Icon(
                                      Icons.loop_outlined,
                                      color: ThemeHelper.white,
                                    );
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => _cameraController.switchCamera(),
                          ),
                        ],
                      ),
                      // SizedBox(height: 27.h),
                      // MyQrCodeButton(
                      //   onPressed: () => Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const MyQrCodeScreen(),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
