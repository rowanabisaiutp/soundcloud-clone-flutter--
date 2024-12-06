import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Configura notificaciones locales
  static void initialize() {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    _localNotificationsPlugin.initialize(initSettings);
  }

  /// Muestra una notificación local
  static Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotificationsPlugin.show(
      0, // ID de la notificación
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  /// Configura el listener para mensajes entrantes
  static void listenToMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Mensaje recibido en foreground: ${message.notification?.title}");
      showNotification(message);
    });
  }
}
