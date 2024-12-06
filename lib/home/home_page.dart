import 'package:flutter/material.dart';
import 'package:music/home/navbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundCloud Home',
      home: SoundCloudHome(),
    );
  }
}

class SoundCloudHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0), // Color de fondo
      appBar: AppBar(
        title: Text("SoundCloud Home"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a SoundCloud Home!',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            // Botón para mostrar los mensajes recientes (sin la parte de mensajes reales)
            ElevatedButton(
              onPressed: () {
                _showMessagesDialog(context);
              },
              child: Text('Ver Mensajes Recientes'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  // Mostrar el diálogo con los "mensajes recientes"
  void _showMessagesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensajes Recientes'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount:
                  5, // Puedes cambiar la cantidad de "mensajes" que deseas mostrar
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Mensaje $index'),
                  subtitle: Text('Contenido del mensaje $index'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
