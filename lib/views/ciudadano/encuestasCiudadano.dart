import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/notificaciones/configurarNotificaciones.dart';
import 'package:arog_movil/views/administrador/homeAdmin.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:arog_movil/views/ciudadano/realizarEncuestasCiudadano.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Encuestasciudadano extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.notes,
                    size: 28,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Encuestas disponibles',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 78, 78, 78),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildSurveyCard(
                context,
                title: 'Datos generales',
                date: '11/03/2025',
                icon: Icons.note_rounded,
              ),
              const SizedBox(height: 23),
              _buildSurveyCard(
                context,
                title: 'Opiniones y practicas',
                date: '15/03/2025',
                icon: Icons.question_answer,
              ),
              const SizedBox(height: 23),
              _buildSurveyCard(
                context,
                title: '¿Como manejan los residuos?',
                date: '18/03/2025',
                icon: Icons.delete,
              ),
              const SizedBox(height: 23),
              _buildSurveyCard(
                context,
                title: 'Cuentanos como reciclas',
                date: '20/03/2025',
                icon: Icons.pin_drop,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSurveyCard(
    BuildContext context, {
    required String title,
    required String date,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      elevation: 8,
      shadowColor: Colors.lightGreen.withOpacity(0.3),
      margin: const EdgeInsets.all(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Realizarencuestasciudadano(),
            ),
          );
        },
        splashColor: Colors.lightGreen.withOpacity(0.1),
        hoverColor: Colors.lightGreen.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightGreen.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(icon, color: Colors.white, size: 28),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    ' Click para Realizar Encuesta',
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            minVerticalPadding: 0,
          ),
        ),
      ),
    );
  }
}
