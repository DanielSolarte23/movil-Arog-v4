import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: const GaleriaAdmin(),
    );
  }
}

class GaleriaAdmin extends StatefulWidget {
  const GaleriaAdmin({super.key});

  @override
  _GaleriaAdminState createState() => _GaleriaAdminState();
}

class _GaleriaAdminState extends State<GaleriaAdmin> {
  final List<Map<String, dynamic>> images = List.generate(20, (index) {
    DateTime date = DateTime.now().subtract(Duration(days: index * 10));
    return {
      "url": "https://picsum.photos/400/600?random=${index + 1}",
      "date": date,
      "formattedDate": DateFormat('yyyy-MM-dd').format(date),
    };
  });

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
                offset: Offset(4, 4),
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.lightGreen),
            onPressed: () {},
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
    );
  }

  Widget _buildImageCard(BuildContext context, Map<String, dynamic> image) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              image["url"],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 5,
              right: 5,
              child: _buildPopupMenu(context, image),
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
          const PopupMenuItem(
            value: 'date',
            child: Text('Ver fecha'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Eliminar'),
          ),
        ];
      },
    );
  }
}  

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Center(child: Text('Pantalla de Configuración')),
    );
  }
}