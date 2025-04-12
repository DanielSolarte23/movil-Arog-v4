import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/administrador/homeAdmin.dart';
import 'package:arog_movil/views/recolector/rutasRecolector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class configurarNotificaciones extends StatefulWidget {
  @override
  _ConfigurarNotificacionesState createState() =>
      _ConfigurarNotificacionesState();
}

class _ConfigurarNotificacionesState extends State<configurarNotificaciones> {
  bool todasNotificaciones = false;
  bool notificacionesEmail = false;
  bool notificacionesBurbuja = false;

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
                MaterialPageRoute(builder: (context) => HomeAdmin()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.lightGreen,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RutasRecolector(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 85),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person,
                        size: 28,
                        color: Color.fromARGB(255, 78, 78, 78),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Perfil',
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
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.lightGreen),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(4, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/Perfil.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30),
            const SizedBox(height: 30),
            const Text(
              'Configurar notificaciones',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 78, 78, 78),
              ),
            ),
            const SizedBox(height: 40),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 80.0),
              leading: const Icon(
                Icons.notifications_active,
                color: Colors.lightGreen,
              ),
              title: const Text(
                'Activar todas las notificaciones',
                style: TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                textAlign: TextAlign.center,
              ),
              trailing: Checkbox(
                value: todasNotificaciones,
                onChanged: (bool? value) {
                  setState(() {
                    todasNotificaciones = value ?? false;
                  });
                },
                activeColor: Colors.lightGreen,
              ),
              onTap: () {
                setState(() {
                  todasNotificaciones = !todasNotificaciones;
                });
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 80.0),
              leading: const Icon(
                Icons.notification_important,
                color: Colors.lightGreen,
              ),
              title: const Text(
                'Enviar notificaciones al correo',
                style: TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                textAlign: TextAlign.center,
              ),
              trailing: Checkbox(
                value: notificacionesEmail,
                onChanged: (bool? value) {
                  setState(() {
                    notificacionesEmail = value ?? false;
                  });
                },
                activeColor: Colors.lightGreen,
              ),
              onTap: () {
                setState(() {
                  notificacionesEmail = !notificacionesEmail;
                });
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 80.0),
              leading: const Icon(Icons.bubble_chart, color: Colors.lightGreen),
              title: const Text(
                'Burbuja de notificaciones',
                style: TextStyle(color: Color.fromARGB(255, 133, 130, 130)),
                textAlign: TextAlign.center,
              ),
              trailing: Checkbox(
                value: notificacionesBurbuja,
                onChanged: (bool? value) {
                  setState(() {
                    notificacionesBurbuja = value ?? false;
                  });
                },
                activeColor: Colors.lightGreen,
              ),
              onTap: () {
                setState(() {
                  notificacionesBurbuja = !notificacionesBurbuja;
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
