import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:file_picker/file_picker.dart'; // Para seleccionar el archivo PDF localmente

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? pdfPath;
  List<String> recentlyOpenedFiles =
      []; // Lista para almacenar los archivos abiertos recientemente

  // Método para abrir un archivo PDF desde el almacenamiento
  Future<void> _openFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfPath = result.files.single.path;
        recentlyOpenedFiles.add(result
            .files.single.name); // Agregar el nombre del archivo a la lista
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para la pantalla
      appBar: AppBar(
        title: const Text(
          "Lector de PDF",
          style: TextStyle(color: Colors.cyanAccent), // Texto en color cian
        ),
        backgroundColor: Colors.black,
        elevation: 0, // Sin sombra
        actions: [
          IconButton(
            icon: const Icon(Icons.folder_open, color: Colors.cyanAccent),
            onPressed: () {}, // Acción vacía por ahora
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Icon(
              Icons.file_copy,
              color: Colors.purpleAccent,
              size: 50,
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Icon(
              Icons.folder,
              color: Colors.orangeAccent,
              size: 50,
            ),
          ),
          Center(
            child: pdfPath == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Selecciona un archivo PDF para ver",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _openFile,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.cyanAccent, // Color del texto
                          side: BorderSide(
                              color: Colors.yellowAccent,
                              width: 2), // Borde de color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Bordes redondeados
                          ),
                        ),
                        child: const Text("Abrir PDF"),
                      ),
                    ],
                  )
                : PDFView(
                    filePath: pdfPath,
                  ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Icon(
              Icons.save_alt,
              color: Colors.greenAccent,
              size: 50,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Icon(
              Icons.settings,
              color: Colors.redAccent,
              size: 50,
            ),
          ),

          // Sección del historial de archivos abiertos
          Positioned(
            bottom: 100, // Ajuste la posición
            left: 10,
            right: 10,
            child: recentlyOpenedFiles.isEmpty
                ? Container() // Si no hay archivos, no mostrar nada
                : Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: recentlyOpenedFiles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              recentlyOpenedFiles[index],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
