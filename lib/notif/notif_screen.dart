import 'package:flutter/material.dart';
import 'package:music/sqllite/notif_sqlite.dart'; // Asegúrate de que tu helper de SQLite esté importado

class NotificacionesScreen extends StatefulWidget {
  @override
  _NotificacionesScreenState createState() => _NotificacionesScreenState();
}

class _NotificacionesScreenState extends State<NotificacionesScreen> {
  final NotificationDbHelper dbHelper = NotificationDbHelper();

  Future<List<Map<String, dynamic>>> _getNotifications() async {
    return await dbHelper.getAllNotifications();
  }

  // Función para borrar la notificación de la base de datos
  void _deleteNotification(int id) async {
    await dbHelper.deleteNotification(id);
    setState(() {}); // Refresca la pantalla después de borrar la notificación
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Title(
            color: Colors.white,
            child: Text(
              'Notificaciones',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
      ),
      body: Stack(
        children: [
          // Texto principal en la parte superior
          Positioned(
            top: 20, // Ajusta el texto de introducción
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aún no ha pasado nada',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Interactúa con gente a la que sigues para generar actividad y recibir actualizaciones',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),

          // ListView de notificaciones
          Positioned(
            top: 0, // Ubicación debajo del texto de introducción
            left: 20,
            right: 20,
            bottom: 0,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _getNotifications(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('', style: TextStyle(color: Colors.white70)));
                } else {
                  List<Map<String, dynamic>> notifications = snapshot.data!;

                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      var notification = notifications[index];
                      return Dismissible(
                        key: Key(notification['id']
                            .toString()), // Usamos el ID como clave
                        direction: DismissDirection
                            .horizontal, // Permite deslizar de ambos lados
                        onDismissed: (direction) {
                          // Eliminar la notificación cuando se desliza
                          _deleteNotification(notification['id']);
                        },
                        background: Container(
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // Color de fondo al deslizar
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        secondaryBackground: Container(
                          color: Colors
                              .red, // Color de fondo al deslizar en el otro lado
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Card(
                          color: Colors.grey[800],
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              notification['title'] ?? 'Sin título',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              notification['body'] ?? 'Sin cuerpo',
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: Text(
                              notification['date'] ?? 'Fecha no disponible',
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
