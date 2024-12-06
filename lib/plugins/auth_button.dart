// auth_button.dart
import 'package:flutter/material.dart';
import 'package:music/plugins/local_auth.dart';

class BiometricAuthButton extends StatelessWidget {
  final BiometricAuth biometricAuth =
      BiometricAuth(); // Instancia de la clase de autenticación

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        BiometricAuth biometricAuth = BiometricAuth();

        try {
          bool canAuthenticate = await biometricAuth.canAuthenticate();
          if (canAuthenticate) {
            bool isAuthenticated = await biometricAuth.authenticate();
            if (isAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Autenticación exitosa")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Autenticación fallida")));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Biometría no disponible en este dispositivo")));
          }
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: $e")));
        }
      },
      child: Text("Autenticarse con huella digital"),
    );
  }
}
