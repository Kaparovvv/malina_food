import 'package:flutter/material.dart';
import 'package:malina_app/commons/icon_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(IconHelper.logoIcon),
      )),
    );
  }
}
