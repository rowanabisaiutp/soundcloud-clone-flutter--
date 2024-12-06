import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  /// Inicializa Firebase
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    await requestPermission();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// Solicita permisos para notificaciones (necesario para iOS)
  static Future<void> requestPermission() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    print("Permisos: ${settings.authorizationStatus}");
  }

  /// Obtiene el token del dispositivo
  static Future<String?> getDeviceToken() async {
    String? token = await FirebaseService.getDeviceToken();
    print("Token del dispositivo: $token");
    return token;
  }

  /// Maneja mensajes en segundo plano
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Mensaje en segundo plano: ${message.messageId}");
  }
}
