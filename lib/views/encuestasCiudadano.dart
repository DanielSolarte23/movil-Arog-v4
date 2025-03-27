import 'package:arog_movil/views/configuracionCiudadano.dart';
import 'package:arog_movil/views/configurarNotificaciones.dart';
import 'package:arog_movil/views/homeAdmin.dart';
import 'package:flutter/material.dart';

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
                MaterialPageRoute(builder: (context) => HomeScreen()),
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
              const Text(
                'Encuestas disponibles',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildSurveyCard(
                context,
                title: 'Datos Generales',
                date: '11/03/2025',
                icon: Icons.bar_chart,
              ),
              const SizedBox(height: 15),
              _buildSurveyCard(
                context,
                title: 'Opiniones y Prácticas',
                date: '15/03/2025',
                icon: Icons.comment,
              ),
              const SizedBox(height: 15),
              _buildSurveyCard(
                context,
                title: '¿Cómo se manejan los residuos?',
                date: '18/03/2025',
                icon: Icons.delete,
              ),
              const SizedBox(height: 15),
              _buildSurveyCard(
                context,
                title: '¿Cuéntanos cómo reciclas?',
                date: '20/03/2025',
                icon: Icons.recycling,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.lightGreen,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date, style: TextStyle(color: Colors.grey)),
        trailing: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Realizar Encuesta',
                style: TextStyle(color: Colors.lightGreen),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.lightGreen),
            ],
          ),
        ),
      ),
    );
  }
}