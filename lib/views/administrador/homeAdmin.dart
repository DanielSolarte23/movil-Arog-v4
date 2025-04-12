import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/notificaciones/configurarNotificaciones.dart';
import 'package:arog_movil/views/administrador/gestionUserAdmin.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:arog_movil/views/administrador/rutasAdmin.dart';
import 'package:arog_movil/views/administrador/tareasAdmin.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Rutas', 'icon': Icons.route, 'route': RutasAdmin()},
    {'title': 'Tareas', 'icon': Icons.assignment, 'route': Tareasadmin()},
    {
      'title': 'Gestión de usuarios',
      'icon': Icons.people_alt,
      'route': GestionUseradmin(),
    },
    {'title': 'Historial de registro', 'icon': Icons.history, 'route': null},
    {'title': 'Pagos', 'icon': Icons.payment, 'route': null},
    {'title': 'Galería', 'icon': Icons.image, 'route': null},
    {'title': 'Informes', 'icon': Icons.info_rounded, 'route': null},
    {'title': 'Registros', 'icon': Icons.person, 'route': null},
    {
      'title': 'Estadísticas y métricas',
      'icon': Icons.analytics,
      'route': null,
    },
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
              hintText: 'Buscar...',
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 150,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(4, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/Arog-1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.grid_view,
                        color: Color.fromARGB(255, 78, 78, 78),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      const Text(
                        'Menú Principal',
                        style: TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (menuItems[index]['route'] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => menuItems[index]['route'],
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.2),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            menuItems[index]['icon'],
                            color: Colors.lightGreen[600],
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              menuItems[index]['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 78, 78, 78),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
