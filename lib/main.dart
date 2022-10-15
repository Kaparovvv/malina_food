import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/circle_cached_network_image.dart';
import 'package:malina_app/models/pushNotification_model.dart';
import 'package:malina_app/screens/splash_screen/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

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
  await Hive.openBox('deviceTokenBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final FirebaseMessaging _messaging;
  // late int _totalNotificationCounter;
  // PushNotificationModel? _pushNotificationModel;
  // Box deviceToken = Hive.box('deviceTokenBox');

  // void registerNotification() async {
  //   await Firebase.initializeApp();
  //   _messaging = FirebaseMessaging.instance;
  //   _messaging.getToken().then((token) {
  //     deviceToken.put('deviceToken', token);
  //     log('Device_token ====== ${deviceToken.get('deviceToken')}');
  //   });
  //   NotificationSettings settings = await _messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     FirebaseMessaging.onMessage.listen(
  //       (RemoteMessage message) {
  //         PushNotificationModel pushNotificationModel = PushNotificationModel(
  //           title: message.notification!.title,
  //           body: message.notification!.body,
  //           dataTitle: message.data['title'],
  //           dataBody: message.data['body'],
  //           dataIcon: message.data['icon'],
  //         );
  //         setState(() {
  //           _totalNotificationCounter++;
  //           _pushNotificationModel = pushNotificationModel;
  //         });

  //         if (_pushNotificationModel != null) {
  //           showSimpleNotification(
  //             Text('${_pushNotificationModel!.title}'),
  //             leading: CircleCachedNetworkImageWidget(
  //               imageUrl: _pushNotificationModel!.dataIcon,
  //               width: 30.w,
  //               height: 30.h,
  //             ),
  //             subtitle: Text('${_pushNotificationModel!.body}'),
  //             background: ThemeHelper.backBlur,
  //             duration: const Duration(seconds: 5),
  //           );
  //         }
  //       },
  //     );
  //   } else {
  //     log('User granted the permission');
  //   }
  // }

  // checkForInitialMessage() async {
  //   await Firebase.initializeApp();
  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   if (initialMessage != null) {
  //     PushNotificationModel pushNotificationModel = PushNotificationModel(
  //       title: initialMessage.notification!.title ?? '',
  //       body: initialMessage.notification!.body,
  //       dataTitle: initialMessage.data['title'],
  //       dataBody: initialMessage.data['body'],
  //     );
  //     setState(() {
  //       _totalNotificationCounter++;
  //       _pushNotificationModel = pushNotificationModel;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     PushNotificationModel pushNotificationModel = PushNotificationModel(
  //       title: message.notification!.title,
  //       body: message.notification!.body,
  //       dataTitle: message.data['title'],
  //       dataBody: message.data['body'],
  //     );
  //     setState(() {
  //       _totalNotificationCounter++;
  //       _pushNotificationModel = pushNotificationModel;
  //     });
  //   });

  //   registerNotification();
  //   checkForInitialMessage();
  //   _totalNotificationCounter = 0;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MALINA',
          theme: ThemeData(canvasColor: Colors.white),
          home: const SplashScreen(),
          // const NavBarWidget(currentIndex: 2)
          // const HomeScreen(),
        ),
      ),
    );
  }
}
