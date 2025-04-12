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
    // Controladores individuales para cada campo
    final routeNameController = TextEditingController();
    final dateTimeController = TextEditingController();
    final userController = TextEditingController();
    final vehicleController = TextEditingController();
    final formTypeController = TextEditingController();
    final collectionPointController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Editar Ruta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: routeNameController,
                    label: 'Nombre de la ruta',
                    icon: Icons.route,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: dateTimeController,
                    label: 'Fecha y hora de inicio',
                    icon: Icons.access_time,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: userController,
                    label: 'Usuario asignado',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: vehicleController,
                    label: 'Vehículo',
                    icon: Icons.local_shipping,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: formTypeController,
                    label: 'Tipo de formulario',
                    icon: Icons.description,
                  ),
                  const SizedBox(height: 15),
                  _buildCollectionPointsSection(
                    controller: collectionPointController,
                  ),
                  const SizedBox(height: 25),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Construir campos de texto consistentes
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
        ),
        prefixIcon: Icon(icon, color: Colors.lightGreen),
      ),
    );
  }

  // Widget para la sección de puntos de recolección
  Widget _buildCollectionPointsSection({
    required TextEditingController controller,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Puntos de recolección',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.lightGreen, width: 1.0),
            ),
            prefixIcon: Icon(Icons.location_on, color: Colors.lightGreen),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                controller.clear();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_circle),
              color: Colors.lightGreen,
              onPressed: () {
                // Lógica para agregar punto de recolección
              },
            ),
          ],
        ),
      ],
    );
  }

  // Widget para los botones de acción
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            // lógica para guardar los cambios
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cambios guardados correctamente'),
                backgroundColor: Colors.lightGreen,
              ),
            );
          },
          child: const Text(
            'Guardar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showNuevaRutaModal(BuildContext context) {
    // Controladores para cada campo
    final routeNameController = TextEditingController();
    final startTimeController = TextEditingController();
    final userController = TextEditingController();
    final vehicleController = TextEditingController();
    final formTypeController = TextEditingController();
    final collectionPointController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Agregar nueva ruta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: routeNameController,
                    label: 'Nombre de la ruta',
                    icon: Icons.route,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: startTimeController,
                    label: 'Hora de inicio',
                    icon: Icons.access_time,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: userController,
                    label: 'Usuario asignado',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: vehicleController,
                    label: 'Vehículo',
                    icon: Icons.local_shipping,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: formTypeController,
                    label: 'Tipo de formulario',
                    icon: Icons.description,
                  ),
                  const SizedBox(height: 15),
                  _buildCollectionPointsSection(
                    controller: collectionPointController,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Lógica para guardar la nueva ruta
                          final routeName = routeNameController.text;
                          final startTime = startTimeController.text;
                          final user = userController.text;
                          final vehicle = vehicleController.text;
                          final formType = formTypeController.text;
                          final collectionPoints =
                              collectionPointController.text;

                          print('Nombre de la ruta: $routeName');
                          print('Hora de inicio: $startTime');
                          print('Usuario asignado: $user');
                          print('Vehículo: $vehicle');
                          print('Tipo de formulario: $formType');
                          print('Puntos de recolección: $collectionPoints');

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Ruta creada correctamente'),
                              backgroundColor: Colors.lightGreen,
                            ),
                          );
                        },
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.pin_drop,
                      size: 28,
                      color: Color.fromARGB(255, 78, 78, 78),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Rutas',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 78, 78),
                      ),
                    ),
                  ],
                ),
              ],
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
