import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:music/account_connect/acoount.dart';
import 'package:music/create_count.dart/cerate_count.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Función para registrar al usuario con correo y contraseña
  Future<void> _registerWithEmail(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // Verifica si los campos están vacíos
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    // Verifica si las contraseñas coinciden
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }

    try {
      // Registro del usuario con Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Redirige al usuario a la pantalla de cuenta conectada o inicio
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuenta creada exitosamente')),
      );

      // Navega a la pantalla de cuenta conectada (puedes cambiar a otra pantalla)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrarse: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.black,
      ),
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
                  'Crea tu cuenta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Campo de texto para correo electrónico
              TextFormField(
                controller: _emailController,
                style: const TextStyle(
                  color: Colors.white, // Establece el color del texto a blanco
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 39, 39, 39), // Color de fondo del campo
                  hintText: 'Tu dirección de email',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 253, 253, 253), // Color del texto de la sugerencia
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Campo de texto para la contraseña
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.white, // Establece el color del texto a blanco
                ),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 39, 39, 39),
                  hintText: 'Tu contraseña',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de texto para confirmar la contraseña
              TextFormField(
                controller: _confirmPasswordController,
                style: const TextStyle(
                  color: Colors.white, // Establece el color del texto a blanco
                ),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 39, 39, 39),
                  hintText: 'Confirma tu contraseña',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botón de continuar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _registerWithEmail(context),
                child: const Text(
                  'Registrarme',
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158), fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),

              // Enlace de ayuda
              GestureDetector(
                onTap: () {
                  // Acción para "¿Necesitas ayuda?"
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '¿Necesitas ayuda?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Texto legal
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Cuando te registras, aceptas que podemos usar los datos que has proporcionado para el registro y para enviarte notificaciones sobre nuestros productos y servicios. Puedes anular la suscripción de las notificaciones en cualquier momento en tu configuración. Para más información, consulta nuestra Política de privacidad.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
