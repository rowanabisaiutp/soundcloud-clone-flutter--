import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music/sqllite/databasehelper.dart';
import 'package:path_provider/path_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Controladores para los campos de correo y contraseña
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  // Método para iniciar sesión con Google
  Future<void> _signInWithEmail() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // Usuario canceló el inicio de sesión

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      print("Inicio de sesión exitoso: ${user?.email}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al iniciar sesión con Google: $e';
      });
    }
  }

  // Método para iniciar sesión con correo y contraseña
  Future<void> _signInWithGoogle() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor ingresa tu correo y contraseña';
      });
      return;
    }

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      print("Inicio de sesión exitoso: ${user?.email}");

      // Generar y guardar un archivo con el correo del usuario
      if (user != null) {
        await _saveEmailToFile(user.email!);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al iniciar sesión con correo: $e';
      });
    }
  }

  // Método para guardar el correo en un archivo
  Future<void> _saveEmailToFile(String email) async {
    try {
      // Obtiene el directorio donde almacenar el archivo
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/user_email.txt';

      // Crea el archivo si no existe
      final file = File(filePath);

      // Escribe el correo electrónico en el archivo
      await file.writeAsString('Correo: $email\n',
          mode: FileMode.writeOnlyAppend);

      print("Correo guardado en el archivo: $filePath");
    } catch (e) {
      print("Error al guardar el correo en el archivo: $e");
    }
  }

// Almacenar el correo electrónico en SQLite
  Future<void> _storeEmail(String email) async {
    final dbHelper = DatabaseHelper();
    await dbHelper.insert({
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de correo
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'Ingresa tu correo',
                errorText: _errorMessage == null ? null : 'Correo no válido',
              ),
            ),
            SizedBox(height: 16),
            // Campo de contraseña
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingresa tu contraseña',
                errorText:
                    _errorMessage == null ? null : 'Contraseña incorrecta',
              ),
            ),
            SizedBox(height: 16),
            // Botón para iniciar sesión con correo y contraseña
            ElevatedButton(
              onPressed: _signInWithEmail,
              child: Text('Iniciar sesión con correo'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 16),
            // Botón para iniciar sesión con Google
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Text('Iniciar sesión con Google'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().queryAllRows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            var email = snapshot.data?.first['email'];
            return Center(
              child: Text("Correo almacenado: $email"),
            );
          } else {
            return Center(child: Text("No hay correos almacenados"));
          }
        },
      ),
    );
  }
}
