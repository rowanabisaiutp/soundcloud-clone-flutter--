import 'package:flutter/material.dart';

class Upgrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra superior personalizada
          SizedBox(height: 70),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/person.jpg',
                fit: BoxFit.cover,
                width: 200, // Ajusta el ancho para que sea más delgada
                height: 325, // Ajusta la altura para que sea más delgada
              ),
            ),
          ),

          SizedBox(height: 60),
          // Etiquetas
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Alineación izquierda
            child: Row(
              children: [
                // Botón "NEXT PRO" con el avatar e ícono de estrella integrado
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 57, 57, 57),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      // Avatar con la estrella en el centro
                      CircleAvatar(
                        radius: 8, // Tamaño del avatar
                        backgroundColor: Colors.red,
                        child: Icon(Icons.star, color: Colors.white, size: 10),
                      ),
                      SizedBox(width: 5), // Espacio entre el avatar y el texto
                      Text(
                        "NEXT PRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 10), // Espacio entre "NEXT PRO" y "PARA ARTISTAS"
                _buildLabel("PARA ARTISTAS", Colors.blue),
              ],
            ),
          ),

          SizedBox(height: 10),
          // Texto principal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Accede a herramientas\nde artista y cargas ilimitadas.",
              textAlign: TextAlign.left, // Alineación izquierda
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Descripción secundaria
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Por \$1,725.00, con facturación anual.\nPuedes cancelar en cualquier momento. Existen algunas limitaciones.",
              textAlign: TextAlign.left, // Alineación izquierda
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Botón principal centrado y más grande
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Accion para el
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 120), // Tamaño más grande
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Consigue Next Pro",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ), // Texto más grande
              ),
            ),
          ),
          SizedBox(height: 5),
          // Enlace secundario centrado
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Ver todos los planes",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14),
              ),
            ),
          ),
          // Barra inferior de navegación
        ],
      ),
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
