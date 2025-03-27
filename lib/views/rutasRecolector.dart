import 'package:arog_movil/views/configuracionCiudadano.dart';
import 'package:arog_movil/views/perfilCiudadano.dart';
import 'package:flutter/material.dart';

class RutasRecolector extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Ruta ', 'icon': Icons.route},
    {'title': 'Historial ruta', 'icon': Icons.assignment},
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Rutas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(width: 2, color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(4, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/Arog-2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0, 
                runSpacing: 20.0, 
                children: menuItems.map((item) {
                  return SizedBox(
                    width: 120, 
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item['icon'],
                                color: Colors.lightGreen[600],
                                size: 30,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 260,
              color: const Color.fromARGB(255, 121, 177, 61),
            ),
          ],
        ),
      ),
    );
  }
}