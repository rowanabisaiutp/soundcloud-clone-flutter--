import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image; // Variable para almacenar la imagen seleccionada

  // Método para abrir la cámara
  void _openCamera() async {
    final picker = ImagePicker();
    // Abre la cámara para tomar una foto
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile
            .path); // Asignamos la imagen capturada a la variable _image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap:
                  _openCamera, // Abrir cámara al hacer clic en la imagen de perfil
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? const Icon(Icons.camera_alt,
                        size: 40, color: Colors.white)
                    : null, // Si no hay imagen, muestra el ícono de la cámara
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rowan abisai Ojeda kumul',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '0 seguidores · 3 siguiendo',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            sectionTitle('Reposts'),
            const SizedBox(height: 10),
            itemCard('rockstar - post malone (ending looped)', '740K', '2:23'),
            itemCard(
                'Tech House | Remix, Edits...', '18.2K', 'Lista · 177 pistas'),
            const SizedBox(height: 20),
            sectionTitle('Me gusta'),
            const SizedBox(height: 10),
            itemCard('Taking my Time', '2.4K', '3:03'),
            itemCard('TOUCHIN\'', '178', '2:39'),
            itemCard('JID - surround sound ft.21savage', '81K', '4:03'),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget itemCard(String title, String views, String duration) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey,
          child: const Icon(Icons.music_note, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        subtitle: Text(
          '$views · $duration',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}
