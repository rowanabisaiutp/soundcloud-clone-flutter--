import 'package:flutter/material.dart';

class RelatedTracksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RelatedTrackCard(
            'Taking my Time',
            'Jazzy A, fixxyo, clipp.art, JAYC',
            'assets/spinnin_2.jpg', // Ruta local de la imagen de fondo
          ),
          RelatedTrackCard(
            'rockstar - post ma...',
            'LIV, L<3, O_Tal_Do_Otta, gaichi.',
            'assets/post.jpg', // Ruta local de la imagen de fondo
          ),
          RelatedTrackCard(
            'JID - surround sou...',
            'Flowrics, sawcy_boy, King Magic',
            'assets/spinnin_3.jpg', // Ruta local de la imagen de fondo
          ),
        ],
      ),
    );
  }
}

class RelatedTrackCard extends StatelessWidget {
  final String title;
  final String artists;
  final String imagePath; // Nuevo parámetro para la imagen

  RelatedTrackCard(this.title, this.artists, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170, // Ancho fijo de la tarjeta
      height: 100, // Altura fija de la tarjeta
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // Cargar imagen desde assets
          fit: BoxFit
              .cover, // Ajuste de la imagen para cubrir todo el contenedor
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, // Alineamos los elementos hacia abajo
        children: [
          // Fondo opaco en la parte inferior para que el texto sea legible
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5), // Fondo oscuro
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13, // Ajustamos el tamaño del texto
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  artists,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11, // Ajustamos el tamaño del texto
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SoundCloudBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Fondo decorativo con imagen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'), // Ruta de la imagen
            fit: BoxFit.cover, // La imagen cubre todo el fondo
          ),
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Sombra alrededor
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(8.0),
        child: Container(
          // Tarjeta principal
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 27, 27, 27),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centra horizontalmente
            children: [
              Text(
                'Olvídate de los anuncios con SoundCloud Go',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, // Alineación central
              ),
              SizedBox(height: 8),
              Text(
                'Despídete de los anuncios',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center, // Alineación central
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,
                  ), // Borde blanco
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Bordes redondeados
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 12), // Altura del botón
                  minimumSize: Size(double.infinity, 48), // Botón largo
                ),
                child: Text(
                  'Comienza',
                  style: TextStyle(
                    color: Colors.white, // Texto blanco
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Puedes cancelar en cualquier momento. Existen algunas limitaciones.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center, // Alineación central
              ),
            ],
          ),
        ),
      ),
    );
  }
}
