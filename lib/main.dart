import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'google_sign_in.dart';
import 'notification_service.dart';

const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: _androidNotificationDetails);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationService().init();
  await Firebase.initializeApp();

  runApp(MyApp());
}

const AndroidNotificationDetails _androidNotificationDetails =
    AndroidNotificationDetails(
  'channel ID',
  'channel name',
  playSound: true,
  priority: Priority.high,
  importance: Importance.high,
);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "title",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: getAuth(),
      ));

  Widget getAuth() {
    if (FirebaseAuth.instance.currentUser == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}


