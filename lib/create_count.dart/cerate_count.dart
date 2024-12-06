import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music/account_connect/acoount.dart';
import 'package:local_auth/local_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Método para iniciar sesión con Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountConnectedScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> _authenticateWithFingerprint() async {
    bool canAuthenticate = await _localAuth.canCheckBiometrics;
    if (!canAuthenticate) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('No se puede usar la huella digital en este dispositivo.')));
      return;
    }

    // Comprobar los métodos biométricos disponibles en el dispositivo
    List<BiometricType> availableBiometrics =
        await _localAuth.getAvailableBiometrics();

    if (availableBiometrics.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No hay métodos biométricos disponibles.')));
      return;
    }

    // Intentar autenticarse con huella digital
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Por favor, autentícate con tu huella digital',
        options: AuthenticationOptions(
          stickyAuth: true, // Mantener la autenticación activa
          useErrorDialogs:
              true, // Mostrar diálogos de error si falla la autenticación
          biometricOnly: true, // Solo permitir autenticación biométrica
        ),
      );

      if (isAuthenticated) {
        // Si la autenticación es exitosa, navegar a la pantalla de cuenta conectada
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AccountConnectedScreen()),
        );
      } else {
        // Si la autenticación falla, mostrar un mensaje de error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Autenticación fallida.')));
      }
    } catch (e) {
      // Si ocurre un error en el proceso de autenticación, mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error durante la autenticación: $e')));
    }
  }

  // Método para iniciar sesión con correo y contraseña
  Future<void> _signInWithEmail() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Por favor, ingresa todos los campos')));
        return;
      }

      // Iniciar sesión con correo y contraseña
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountConnectedScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al iniciar sesión: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Inicia sesión o crea una cuenta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Botón de Facebook
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Acción para iniciar sesión con Facebook
                },
                icon: const Icon(Icons.facebook, color: Colors.white),
                label: const Text(
                  'Continuar con Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Botón de Google
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 90, 90, 90),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _signInWithGoogle(context),
                icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                label: const Text(
                  'Continuar con Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Botón de Apple
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Acción para iniciar sesión con Apple
                },
                icon: const Icon(Icons.apple, color: Colors.white),
                label: const Text(
                  'Continuar con Apple',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),

              // Botón de huella digital (nuevo)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Color verde
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _authenticateWithFingerprint,
                icon: const Icon(Icons.fingerprint, color: Colors.white),
                label: const Text(
                  'Iniciar sesión con Huella Digital',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),

              // Texto: O por correo electrónico
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'O por correo electrónico',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Campos de correo y contraseña
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Botón de iniciar sesión con correo y contraseña
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _signInWithEmail,
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
