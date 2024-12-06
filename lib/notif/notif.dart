import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music/firebase_options.dart';
import 'package:music/notif/api.dart';
import 'package:music/notif/hoola.dart';
import 'package:music/notif/local_notif.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HolaMundo(),
      navigatorKey: navigatorKey,
      routes: {
        '/notificaciones': (context) => NotifPage(),
      },
    );
  }
}
