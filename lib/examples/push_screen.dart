import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/models/pushNotification_model.dart';
import 'package:overlay_support/overlay_support.dart';

class PushScreen extends StatefulWidget {
  const PushScreen({super.key});

  @override
  State<PushScreen> createState() => _PushScreenState();
}

class _PushScreenState extends State<PushScreen> {
  late final FirebaseMessaging _messaging;
  late int _totalNotificationCounter;
  PushNotificationModel? _pushNotificationModel;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    await _messaging.getToken().then((token) {
      print('Device_token ====== $token');
    });
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          PushNotificationModel pushNotificationModel = PushNotificationModel(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body'],
          );
          setState(() {
            _totalNotificationCounter++;
            _pushNotificationModel = pushNotificationModel;
          });

          if (_pushNotificationModel != null) {
            showSimpleNotification(
              Text('${_pushNotificationModel!.title}'),
              leading: CounterWidget(
                  totalNotificationCounter: _totalNotificationCounter),
              subtitle: Text('${_pushNotificationModel!.body}'),
              background: ThemeHelper.backBlur,
              duration: const Duration(seconds: 5),
            );
          }
        },
      );
    } else {
      log('User granted the permission');
    }
  }

  //boyan01.github.io/overlay_support/#/

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotificationModel pushNotificationModel = PushNotificationModel(
        title: initialMessage.notification!.title ?? '',
        body: initialMessage.notification!.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );
      setState(() {
        _totalNotificationCounter++;
        _pushNotificationModel = pushNotificationModel;
      });
    }
  }

  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotificationModel pushNotificationModel = PushNotificationModel(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      setState(() {
        _totalNotificationCounter++;
        _pushNotificationModel = pushNotificationModel;
      });
    });

    registerNotification();
    checkForInitialMessage();
    _totalNotificationCounter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PushNotification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Malina PushNotification'),
          CounterWidget(totalNotificationCounter: _totalNotificationCounter),
          _pushNotificationModel != null
              ? Column(
                  children: [
                    Text(
                        'Title ${_pushNotificationModel!.dataTitle ?? _pushNotificationModel!.title}'),
                    Text(
                        'Title ${_pushNotificationModel!.dataBody ?? _pushNotificationModel!.body}'),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required int totalNotificationCounter,
  })  : _totalNotificationCounter = totalNotificationCounter,
        super(key: key);

  final int _totalNotificationCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: ThemeHelper.yellow,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$_totalNotificationCounter',
          style: TextStyleHelper.f16w400,
        ),
      ),
    );
  }
}
