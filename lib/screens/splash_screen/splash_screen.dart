// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/examples/offerTheRegister_screen.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/auth_screen.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/bottomNavigationBar_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

  Future _navigate() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OfferTheRegisterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Image(
          image: AssetImage(ImageHelper.splashScreen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
