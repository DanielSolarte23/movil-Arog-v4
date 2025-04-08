import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:arog_movil/views/recolector/rutasRecolector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Configuracion',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.lightGreen),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RutasRecolector()),
            );
          },
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.lightGreen),
            title: const Text(
              'Perfil',
              style: TextStyle(color: Color.fromARGB(255, 133, 130, 130),fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfilciudadano()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.lightGreen),
            title: const Text(
              'Soporte',
              style: TextStyle(color: Color.fromARGB(255, 133, 130, 130),fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.lightGreen),
            title: const Text(
              'Activar modo oscuro',
              style: TextStyle(color: Color.fromARGB(255, 133, 130, 130),fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.lightGreen),
            title: const Text(
              'Ayuda',
              style: TextStyle(color: Color.fromARGB(255, 133, 130, 130),fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.lightGreen),
            title: const Text(
              'Cerrar sesion',
              style: TextStyle(color: Color.fromARGB(255, 133, 130, 130),fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
