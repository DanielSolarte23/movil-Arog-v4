import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/notificaciones/configurarNotificaciones.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Realizarencuestasciudadano extends StatelessWidget {
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
        ],
      ),
      
    );
  }
}
