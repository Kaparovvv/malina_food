import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/screens/nav_bar_widget.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  await Hive.openBox('refreshTokenBox');
  await Hive.openBox('apiBox');
  await Hive.openBox('idBox');
  await Hive.openBox('branchBox');
  await Hive.openBox('numberBox');
  await Hive.openBox('categoriesIdBox');
  await Hive.openBox('storeIdBox');
  await Hive.openBox('subcategoryID');
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
          home: const NavBarWidget(currentIndex: 2)
          // const HomeScreen(),
          // const SplashScreen(),
          ),
    );
  }
}
