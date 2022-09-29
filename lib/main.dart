import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/screens/splash_screen/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  await Hive.openBox('refreshTokenBox');
  await Hive.openBox('apiBox');
  await Hive.openBox('idBox');
  await Hive.openBox('branchBox');
  await Hive.openBox('storeIdBox');
  await Hive.openBox('numberBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(canvasColor: Colors.white),
          home: 
          // const HomeScreen(),
          const SplashScreen(),
          ),
    );
  }
}
