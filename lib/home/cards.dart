import 'package:flutter/material.dart';

class SoundCloudCardsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fila de dos tarjetas horizontales
        Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // Alineación más cercana de las tarjetas
          children: [
            // Tarjeta izquierda
            Container(
              width: 200,
              height: 80, // Ajustamos la altura para que encaje bien en la fila
              margin: EdgeInsets.all(2.0), // Reducimos el margen entre tarjetas
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 31, 31), // Color gris más oscuro
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Avatar a la izquierda
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/person.jpg'), // Reemplaza con la ruta de tu imagen
                  ),

                  // Espaciado entre el avatar y el texto
                  SizedBox(width: 4),

                  // Expanded para que el texto ocupe el espacio restante
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinea todo a la izquierda
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centra el texto verticalmente
                      children: [
                        // Texto principal
                        Row(
                          children: [
                            Text(
                              'Excision live a UMF', // Texto principal
                              style: TextStyle(
                                color:
                                    Colors.white, // Color blanco para el texto
                                fontSize: 10, // Tamaño del texto
                                fontWeight:
                                    FontWeight.bold, // Peso de la fuente
                              ),
                            ),
                            SizedBox(
                                width:
                                    2), // Espaciado entre el texto y el ícono
                            Icon(
                              Icons.verified, // Ícono de verificación
                              color: Colors.blue, // Color azul para el ícono
                              size: 20, // Tamaño del ícono
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                0), // Espaciado entre el texto y el subtexto

                        // Subtexto debajo del texto principal
                        Text(
                          'Ultra Miami 2024', // Subtexto
                          style: TextStyle(
                            color: Colors
                                .white54, // Color más suave para el subtexto
                            fontSize: 12, // Tamaño más pequeño para el subtexto
                            fontWeight: FontWeight
                                .normal, // Peso de la fuente para el subtexto
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tarjeta derecha
            Container(
              width: 200,
              height: 80, // Ajustamos la altura para que encaje bien en la fila
              margin: EdgeInsets.all(2.0), // Reducimos el margen entre tarjetas
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 31, 31), // Color gris más oscuro
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Avatar a la izquierda
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/person_1.png'), // Reemplaza con la ruta de tu imagen
                  ),
                  // Espaciado entre el avatar y el texto
                  SizedBox(width: 4),

                  // Expanded para que el texto ocupe el espacio restante
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinea todo a la izquierda
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centra el texto verticalmente
                      children: [
                        // Texto principal
                        Row(
                          children: [
                            Text(
                              'SVDDEN DEATH', // Texto principal
                              style: TextStyle(
                                color:
                                    Colors.white, // Color blanco para el texto
                                fontSize: 10, // Tamaño del texto
                                fontWeight:
                                    FontWeight.bold, // Peso de la fuente
                              ),
                            ),
                            SizedBox(
                                width:
                                    2), // Espaciado entre el texto y el ícono
                            Icon(
                              Icons.verified, // Ícono de verificación
                              color: Colors.blue, // Color azul para el ícono
                              size: 20, // Tamaño del ícono
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                0), // Espaciado entre el texto y el subtexto

                        // Subtexto debajo del texto principal
                        Text(
                          'UMF Megastructure', // Subtexto
                          style: TextStyle(
                            color: Colors
                                .white54, // Color más suave para el subtexto
                            fontSize: 12, // Tamaño más pequeño para el subtexto
                            fontWeight: FontWeight
                                .normal, // Peso de la fuente para el subtexto
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Espacio mínimo entre filas (entre las dos filas de tarjetas)
        SizedBox(height: 2), // Reduce la distancia entre las filas de tarjetas

        // Fila de dos nuevas tarjetas abajo
        Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // Alineación más cercana de las tarjetas
          children: [
            // Nueva tarjeta izquierda
            Container(
              width: 200,
              height: 80, // Ajustamos la altura para que encaje bien en la fila
              margin: EdgeInsets.all(2.0), // Reducimos el margen entre tarjetas
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 31, 31),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Avatar a la izquierda
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/persona_2.jpg'), // Reemplaza con la ruta de tu imagen
                  ),

                  // Espaciado entre el avatar y el texto
                  SizedBox(width: 4),

                  // Expanded para que el texto ocupe el espacio restante
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinea todo a la izquierda
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centra el texto verticalmente
                      children: [
                        // Texto principal
                        Row(
                          children: [
                            Text(
                              'Slipknot', // Texto principal
                              style: TextStyle(
                                color:
                                    Colors.white, // Color blanco para el texto
                                fontSize: 10, // Tamaño del texto
                                fontWeight:
                                    FontWeight.bold, // Peso de la fuente
                              ),
                            ),
                            SizedBox(
                                width:
                                    2), // Espaciado entre el texto y el ícono
                            Icon(
                              Icons.verified, // Ícono de verificación
                              color: Colors.blue, // Color azul para el ícono
                              size: 20, // Tamaño del ícono
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                0), // Espaciado entre el texto y el subtexto

                        // Subtexto debajo del texto principal
                        Text(
                          'Official Album', // Subtexto
                          style: TextStyle(
                            color: Colors
                                .white54, // Color más suave para el subtexto
                            fontSize: 12, // Tamaño más pequeño para el subtexto
                            fontWeight: FontWeight
                                .normal, // Peso de la fuente para el subtexto
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Nueva tarjeta derecha
            Container(
              width: 200,
              height: 80, // Ajustamos la altura para que encaje bien en la fila
              margin: EdgeInsets.all(2.0), // Reducimos el margen entre tarjetas
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 31, 31),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Avatar a la izquierda
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/CURBI.jpg'), // Reemplaza con la ruta de tu imagen
                  ),

                  // Espaciado entre el avatar y el texto
                  SizedBox(width: 4),

                  // Expanded para que el texto ocupe el espacio restante
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinea todo a la izquierda
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centra el texto verticalmente
                      children: [
                        // Texto principal
                        Row(
                          children: [
                            Text(
                              'CURBI', // Texto principal
                              style: TextStyle(
                                color:
                                    Colors.white, // Color blanco para el texto
                                fontSize: 10, // Tamaño del texto
                                fontWeight:
                                    FontWeight.bold, // Peso de la fuente
                              ),
                            ),
                            SizedBox(
                                width:
                                    2), // Espaciado entre el texto y el ícono
                            Icon(
                              Icons.verified, // Ícono de verificación
                              color: Colors.blue, // Color azul para el ícono
                              size: 20, // Tamaño del ícono
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                0), // Espaciado entre el texto y el subtexto

                        // Subtexto debajo del texto principal
                        Text(
                          'Sensation LIVE', // Subtexto
                          style: TextStyle(
                            color: Colors
                                .white54, // Color más suave para el subtexto
                            fontSize: 12, // Tamaño más pequeño para el subtexto
                            fontWeight: FontWeight
                                .normal, // Peso de la fuente para el subtexto
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
