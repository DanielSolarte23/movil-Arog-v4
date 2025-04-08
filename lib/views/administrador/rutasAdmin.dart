import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/notificaciones/configurarNotificaciones.dart';
import 'package:arog_movil/views/administrador/homeAdmin.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:flutter/material.dart';

class RutasAdmin extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Nueva ruta', 'icon': Icons.route},
    {'title': 'Listar', 'icon': Icons.assignment},
    {'title': 'Editar', 'icon': Icons.edit},
  ];

  void _showEditModal(BuildContext context) {
    final TextEditingController _routeNameController = TextEditingController();
    final TextEditingController _routeDescriptionController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Editar Ruta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la ruta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Fecha hora de inicio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.watch, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Usuario asignado',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(
                      Icons.person_add,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Vehiculo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(
                      Icons.car_rental,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Tipo de formulario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.note, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Puntos de recoleccion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.pin_drop, color: Colors.lightGreen),
                  ),
                ),
                const SizedBox(height: 10),

                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.redAccent),
                ),
        
                ListTile(
                  leading: const Icon(Icons.add, color: Color.fromARGB(255, 108, 156, 53)),
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          123,
                          179,
                          59,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        final newName = _routeNameController.text;
                        final newDescription = _routeDescriptionController.text;

                        print('Nuevo nombre: $newName');
                        print('Nueva descripción: $newDescription');

                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ruta actualizada correctamente'),
                            backgroundColor: Colors.lightGreen,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showListarModal(BuildContext context) {
    final TextEditingController _routeNameController = TextEditingController();
    final TextEditingController _routeDescriptionController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Editar Ruta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen[800],
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la ruta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 20),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 15),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          123,
                          179,
                          59,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        final newName = _routeNameController.text;
                        final newDescription = _routeDescriptionController.text;

                        print('Nuevo nombre: $newName');
                        print('Nueva descripción: $newDescription');

                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ruta actualizada correctamente'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              123,
                              179,
                              59,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showNuevaRutaModal(BuildContext context) {
    final TextEditingController _routeNameController = TextEditingController();
    final TextEditingController _routeDescriptionController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Agregar nueva ruta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la ruta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 20),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Hora de inicio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.watch, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Usuario asignado',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.route, color: Colors.lightGreen),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Vehiculo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(
                      Icons.car_rental,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Tipo de formulario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.note, color: Colors.lightGreen),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Hora de inicio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.start, color: Colors.lightGreen),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _routeNameController,
                  decoration: InputDecoration(
                    labelText: 'Puntos de recoleccion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.pin_drop, color: Colors.lightGreen),
                  ),
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          123,
                          179,
                          59,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        final newName = _routeNameController.text;
                        final newDescription = _routeDescriptionController.text;

                        print('Nuevo nombre: $newName');
                        print('Nueva descripción: $newDescription');

                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ruta actualizada correctamente'),
                            backgroundColor: const Color.fromARGB(
                              255,
                              123,
                              179,
                              59,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
          IconButton(
            icon: const Icon(Icons.home, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAdmin()),
              );
            },
          ),
        ],
      ),

      body: Column(
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
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                void handleItemTap() {
                  switch (menuItems[index]['title']) {
                    case 'Nueva ruta':
                      _showNuevaRutaModal(context);
                      break;
                    case 'Listar':
                      _showListarModal(context);
                      break;
                    case 'Editar':
                      _showEditModal(context);
                      break;
                  }
                }

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: InkWell(
                    onTap: handleItemTap,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
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
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 121, 177, 61),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
