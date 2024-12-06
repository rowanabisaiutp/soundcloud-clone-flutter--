import 'package:flutter/material.dart';
import 'package:music/perfil/perfil.dart';

class Biblioteca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage()), // Reemplaza 'NuevaVentana' con tu widget de destino
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                "Biblioteca",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Opciones principales
              _buildLibraryOption("Pistas que me gustan"),
              _buildLibraryOption("Listas"),
              _buildLibraryOption("Álbumes"),
              _buildLibraryOption("Siguiendo"),
              _buildLibraryOption("Emisoras"),
              SizedBox(height: 30),
              // Sección de "Escuchado recientemente"
              Text(
                "Escuchado recientemente",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRecentlyPlayed(
                    "Post Malone",
                    "2.1M seguidores",
                    "assets/post.jpg",
                  ),
                  _buildRecentlyPlayed(
                    "Jazzy A",
                    "22 seguidores",
                    "assets/post.jpg",
                  ),
                  _buildRecentlyPlayed(
                    "Up The Stuss",
                    "28.7K seguidores",
                    "assets/post.jpg",
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Historial de reproducción
              Text(
                "Historial de reproducción",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildPlaybackHistory(
                "S1MBA ft. DTG - Rover (Fast)",
                "1.4M",
                "2:22",
                "assets/person.jpg",
              ),
              _buildPlaybackHistory(
                "MILLION DOLLAR BABY - SPEED UP",
                "23.4K",
                "2:21",
                "assets/person.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLibraryOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildRecentlyPlayed(
      String title, String followers, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        Text(
          followers,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPlaybackHistory(
      String title, String views, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath,
                width: 50, height: 50, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  "$views vistas · $duration",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
