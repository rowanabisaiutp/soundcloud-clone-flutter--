import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music/home/home_page.dart';

class AccountConnectedScreen extends StatelessWidget {
  const AccountConnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el usuario actual de Firebase
    User? user = FirebaseAuth.instance.currentUser;

    // Verificar si el usuario está logueado
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text('No hay usuario conectado'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinea todo hacia arriba
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logos de SoundCloud y Google
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de SoundCloud
                Image.asset(
                  'assets/soundcloud.png', // Reemplaza con la ruta de tu logo
                  height: 80,
                ),
                // Espaciado entre la imagen de SoundCloud y la línea
                const SizedBox(
                    width:
                        30), // Ajusta el valor del width para separar más o menos
                // Línea vertical blanca (usando Container)
                Container(
                  width: 1,
                  height: 70, // Altura de la línea
                  color: Colors.white, // Color de la línea
                ),
                // Espaciado entre la línea y la imagen de Google
                const SizedBox(
                    width:
                        30), // Ajusta el valor del width para separar más o menos
                // Imagen de Google
                Image.asset(
                  'assets/google.png', // Reemplaza con la ruta de tu logo
                  height: 100,
                ),
              ],
            ),

            const SizedBox(
                height: 20), // Reducir el espacio después de los logos

            // Texto principal
            const Text(
              'Tu cuenta se ha conectado correctamente con Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
                height: 16), // Ajustar el espacio entre el texto y el nombre

            // Mostrar nombre y correo electrónico del usuario
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Alinea los textos en el centro
              children: [
                // Texto de Nombre
                Expanded(
                  child: Text(
                    'Bienvenido ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.end, // Alineado a la derecha
                  ),
                ),
                const SizedBox(width: 5), // Espacio entre los dos textos
                // Texto de Correo
                Expanded(
                  child: Text(
                    '${user.email ?? "No disponible"}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start, // Alineado a la izquierda
                  ),
                ),
              ],
            ),
            const Text(
              'Toca continuar para ver los contenidos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10), // Ajustar el espacio antes del botón

            // Botón de continuar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SoundCloudHome(), // Reemplaza con la pantalla a la que deseas navegar
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
