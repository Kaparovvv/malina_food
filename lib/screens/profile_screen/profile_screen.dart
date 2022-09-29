import 'package:flutter/material.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthScreen(),
    );
  }
}
