import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Tarjeta superior con gradiente
class SoundCloudCardUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 85, 9, 9),
            const Color.fromARGB(255, 54, 54, 54)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Alinea los elementos a la izquierda
            children: [
              // Imagen a la izquierda
              Container(
                width: 40, // Tamaño de la imagen
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/heart.png'), // Asegúrate de cambiar la ruta
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              // Espacio entre la imagen y el texto
              SizedBox(width: 8),

              // Texto blanco al lado de la imagen
              Text(
                'Tus favoritos', // Tu texto personalizado
                style: TextStyle(
                  color: Colors.white, // Establece el color del texto a blanco
                  fontSize: 16, // Tamaño del texto
                  fontWeight: FontWeight
                      .bold, // Puedes personalizar la fuente si lo deseas
                ),
              ),

              // Resto de los elementos (corazón a la derecha)
              Spacer(), // Asegura que el ícono se desplace a la derecha
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20, // Hacemos el CircleAvatar más pequeño
                child: IconButton(
                  icon: Icon(
                    Icons.favorite, // Usamos el ícono de corazón
                    color: Colors.white,
                    size: 20, // Hacemos el ícono más pequeño
                  ),
                  onPressed: () {
                    print('Heart button clicked!');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
