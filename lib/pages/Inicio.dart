import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:music/home/card_grid.dart';
import 'package:music/home/cards.dart';
import 'package:music/home/minicard.dart';
import 'package:music/sqllite/notif_sqlite.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationDbHelper dbHelper =
      NotificationDbHelper(); // Instancia para la base de datos

  @override
  void initState() {
    super.initState();
    _initializeFirebaseMessaging();
    _initializeLocalNotifications();
  }

  // Configuración de Firebase Messaging
  void _initializeFirebaseMessaging() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("Device Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Recibida notificación: ${message.notification?.title}");
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notificación abierta: ${message.notification?.title}");
    });
  }

  // Configuración de las notificaciones locales
  void _initializeLocalNotifications() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Mostrar notificación local y guardarla en la base de datos
  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
    );

    // Guardar la notificación en SQLite
    Map<String, dynamic> notification = {
      'title': message.notification?.title,
      'body': message.notification?.body,
      'date': DateTime.now().toString(),
    };
    await dbHelper.insertNotification(notification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nueva card hacia arriba y más larga
            SoundCloudCardUp(),
            SoundCloudCardsGrid(),
            // Más música de la que te gusta
            SectionTitle('Más música de la que te gusta'),
            RelatedTracksList(),
            // Banner de SoundCloud Go
            SoundCloudBanner(),
          ],
        ),
      ),
    );
  }
}
