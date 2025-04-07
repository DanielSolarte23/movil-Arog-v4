import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_downloader/image_downloader.dart'; // Added image_downloader import
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galería de Fotos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Galeriarecolector(),
    );
  }
}

class Galeriarecolector extends StatefulWidget {
  const Galeriarecolector({super.key});

  @override
  _GaleriarecolectorState createState() => _GaleriarecolectorState();
}

class _GaleriarecolectorState extends State<Galeriarecolector> {
  final List<Map<String, dynamic>> images = List.generate(20, (index) {
    DateTime date = DateTime.now().subtract(Duration(days: index * 10));
    return {
      "url": "https://picsum.photos/400/600?random=${index + 1}",
      "date": date,
      "formattedDate": DateFormat('yyyy-MM-dd').format(date),
      "isLocal": false,
    };
  });

  final ImagePicker _picker = ImagePicker();

  // Added download image function
  Future<void> _downloadImage(String imageUrl) async {
    try {
      var imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Imagen descargada con éxito")),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al descargar: $error")),
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        DateTime date = DateTime.now();
        images.add({
          "url": image.path,
          "date": date,
          "formattedDate": DateFormat('yyyy-MM-dd').format(date),
          "isLocal": true,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> groupedImages = {};
    for (var image in images) {
      String key = DateFormat('MMMM yyyy').format(image["date"]);
      groupedImages.putIfAbsent(key, () => []).add(image);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.lightGreen),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Configuracion()),
            );
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => configurarNotificaciones(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfilciudadano()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: groupedImages.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      var image = entry.value[index];
                      return _buildImageCard(context, image);
                    },
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'camera',
            backgroundColor: Colors.white,
            child: const Icon(Icons.camera_alt, color: Colors.green),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'gallery',
            backgroundColor: Colors.white,
            child: const Icon(Icons.photo_library, color: Colors.green),
            onPressed: () => _pickImage(ImageSource.gallery),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, Map<String, dynamic> image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailsScreen(image: image),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            image["isLocal"]
                ? Image.file(File(image["url"]), fit: BoxFit.cover, width: double.infinity, height: double.infinity)
                : Image.network(image["url"], fit: BoxFit.cover, width: double.infinity, height: double.infinity),
            Positioned(
              top: 5,
              right: 5,
              child: _buildPopupMenu(context, image),
            ),
            // Added download button
            Positioned(
              bottom: 5,
              right: 5,
              child: IconButton(
                icon: const Icon(Icons.download, color: Colors.white),
                onPressed: () {
                  if (!image["isLocal"]) {
                    _downloadImage(image["url"]);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No se puede descargar imágenes locales")),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context, Map<String, dynamic> image) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onSelected: (String value) async {
        if (value == 'delete') {
          setState(() {
            images.remove(image);
          });
        } else if (value == 'date') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Fecha: ${image["formattedDate"]}")),
          );
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(value: 'date', child: Text('Ver fecha')),
          const PopupMenuItem(value: 'delete', child: Text('Eliminar')),
        ];
      },
    );
  }
}

class ImageDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> image;

  const ImageDetailsScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la Imagen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: image["isLocal"]
                  ? Image.file(File(image["url"]), fit: BoxFit.contain)
                  : Image.network(image["url"], fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Fecha: ${image["formattedDate"]}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Added download button in details view
            if (!image["isLocal"])
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text("Descargar"),
                  onPressed: () async {
                    try {
                      var imageId = await ImageDownloader.downloadImage(image["url"]);
                      if (imageId == null) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Imagen descargada con éxito")),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error al descargar: $error")),
                      );
                    }
                  },
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Pantallas de ejemplo para navegación

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: const Center(child: Text('Pantalla de Configuración')),
    );
  }
}

class configurarNotificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: const Center(child: Text('Pantalla de Notificaciones')),
    );
  }
}

class Perfilciudadano extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: const Center(child: Text('Pantalla de Perfil')),
    );
  }
}