import 'package:flutter/material.dart';
import 'package:music/notif/notif_screen.dart';
import 'package:music/pages/biblioteca.dart';
import 'package:music/pages/buscar.dart';
import 'package:music/pages/canal.dart';
import 'package:music/pages/upgrade.dart';
import 'package:music/pages/Inicio.dart';
import 'package:music/pdf/pdf.dart';
import 'package:music/sqllite/notif_sqlite.dart'; // Asegúrate de tener importado el helper de SQLite

class BottomNavBar extends StatefulWidget {
  @override
  _SoundCloudHomeState createState() => _SoundCloudHomeState();
}

class _SoundCloudHomeState extends State<BottomNavBar> {
  int _paginaActual = 0; // Controla la página actual seleccionada
  int unreadNotificationsCount = 0; // Contador de notificaciones no leídas
  final NotificationDbHelper dbHelper =
      NotificationDbHelper(); // Instancia de tu helper de base de datos

  // Lista de pantallas
  final List<Widget> _paginas = [
    Inicio(),
    Canal(), // Página de Canal
    Buscar(), // Página de Buscar
    Biblioteca(), // Página de Biblioteca
    Upgrade(), // Página de Upgrade
  ];

  @override
  void initState() {
    super.initState();
    // Inicia el Stream para escuchar las notificaciones no leídas
    dbHelper.getUnreadNotificationsCount().listen((count) {
      setState(() {
        unreadNotificationsCount = count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight + 50), // Incrementa la altura total
        child: Container(
          margin: EdgeInsets.only(top: 50), // Baja el AppBar 50 píxeles
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            elevation: 0,
            title: Text(
              'SoundClone',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('GET PRO', style: TextStyle(color: Colors.orange)),
              ),
              IconButton(
                  icon: Icon(Icons.picture_as_pdf),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PdfViewerPage()));
                  }),
              IconButton(icon: Icon(Icons.cast), onPressed: () {}),
              IconButton(icon: Icon(Icons.file_upload), onPressed: () {}),
              IconButton(icon: Icon(Icons.email), onPressed: () {}),

              // Icono de notificaciones con punto rojo si hay notificaciones no leídas
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificacionesScreen()),
                      );
                    },
                  ),
                  if (unreadNotificationsCount >
                      0) // Muestra el punto rojo si hay notificaciones no leídas
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth:
                              14, // Asegúrate de que el contenedor sea lo suficientemente grande
                          minHeight:
                              14, // Asegúrate de que el contenedor sea lo suficientemente grande
                        ),
                        child: Center(
                          child: Text(
                            '$unreadNotificationsCount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: _paginas[_paginaActual], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _paginaActual, // Controla la pestaña activa
        onTap: (index) {
          setState(() {
            _paginaActual = index; // Cambia la página según el índice
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.stream), label: 'Canal'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Biblioteca'),
          BottomNavigationBarItem(icon: Icon(Icons.upgrade), label: 'Upgrade'),
        ],
      ),
    );
  }
}
