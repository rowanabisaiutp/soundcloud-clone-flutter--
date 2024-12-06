import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'title': 'Hip Hop & Rap', 'image': 'assets/img/rap.jpg'},
    {'title': 'Jordan Adetunji', 'image': 'assets/img/jordan.jpg'},
    {'title': 'Electronica', 'image': 'assets/img/electronica.jpg'},
    {'title': 'Pop', 'image': 'assets/img/pop.jpg'},
    {'title': 'R&B', 'image': 'assets/img/ryb.jpg'},
    {'title': 'Chill', 'image': 'assets/img/chill.jpg'},
    {'title': 'Fiesta', 'image': 'assets/img/fiesta.jpg'},
    {'title': 'Entreno', 'image': 'assets/img/entreno.jpg'},
    {'title': 'Techno', 'image': 'assets/img/techno.jpg'},
  ];

  final List<Color> borderColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false, // Quita el ícono de retroceso
        title: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[800],
              hintText: 'Buscar',
              hintStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos columnas
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final borderColor = borderColors[index % borderColors.length];

            // Determinar la altura basada en el bloque (cada 4 elementos)
            final double cardHeight;
            switch (index % 4) {
              case 0:
                cardHeight = 120.0; // Card más baja
                break;
              case 1:
                cardHeight = 200.0; // Card más alta
                break;
              case 2:
                cardHeight = 160.0; // Card mediana
                break;
              case 3:
                cardHeight = 140.0; // Card baja
                break;
              default:
                cardHeight = 180.0; // Default (nunca debería ocurrir)
            }

            return Container(
              height: cardHeight,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: borderColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        category['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category['title']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
