import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  final LocalAuthentication _auth = LocalAuthentication();

  // Método para verificar si la biometría está disponible en el dispositivo
  Future<bool> canAuthenticate() async {
    try {
      // Verificar si el dispositivo puede verificar biometría
      bool isAvailable = await _auth.canCheckBiometrics;

      // Verificar si hay biometría configurada
      bool hasBiometrics =
          isAvailable && (await _auth.getAvailableBiometrics()).isNotEmpty;

      return hasBiometrics;
    } catch (e) {
      print("Error al verificar la disponibilidad de biometría: $e");
      return false;
    }
  }

  // Método para autenticar con biometría
  Future<bool> authenticate() async {
    try {
      bool isAuthenticated = await _auth.authenticate(
        localizedReason: 'Por favor, autentíquese con su huella digital.',
        options: AuthenticationOptions(
          stickyAuth: true, // Mantiene la sesión activa
        ),
      );
      return isAuthenticated;
    } catch (e) {
      print("Error durante la autenticación: $e");
      return false; // Retorna false en caso de error
    }
  }

  Future<bool> isDeviceSupported() async {
    try {
      bool isAvailable = await _auth.canCheckBiometrics;
      print("Biometría disponible: $isAvailable");
      return isAvailable;
    } catch (e) {
      print("Error al verificar biometría: $e");
      return false;
    }
  }
}
