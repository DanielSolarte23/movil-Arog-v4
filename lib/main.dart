import 'package:arog_movil/views/administrador/gestionUserAdmin.dart';
import 'package:arog_movil/views/administrador/homeAdmin.dart';
import 'package:arog_movil/views/administrador/rutasAdmin.dart';
import 'package:arog_movil/views/administrador/tareasAdmin.dart';
import 'package:arog_movil/views/ciudadano/encuestasCiudadano.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:arog_movil/views/ciudadano/rutasCiudadano.dart';
import 'package:arog_movil/views/recolector/homeRecolector.dart';
import 'package:arog_movil/views/recolector/rutasRecolector.dart';
import 'package:arog_movil/widgets/pantalla_inicio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AROG-MOVIL',
      home: SplashScreen(),
      routes: {
        // Rutas Administrador
        RouteNames.homeAdmin: (context) => HomeAdmin(),
        RouteNames.rutasAdmin: (context) => RutasAdmin(),
        RouteNames.tareasAdmin: (context) => Tareasadmin(),
        RouteNames.gestionUserAdmin: (context) => GestionUseradmin(),

        // Rutas Ciudadano
        RouteNames.perfilCiudadano: (context) => Perfilciudadano(),
        RouteNames.rutasCiudadano: (context) => RutasCiudadano(),
        RouteNames.encuestasCiudadano: (context) => Encuestasciudadano(),

        // Rutas Recolector
        RouteNames.homeRecolector: (context) => HomeRecolector(),
        RouteNames.rutasRecolector: (context) => RutasRecolector(),
      },
    );
  }
}

class RouteNames {
  // Rutas Administrador
  static const String homeAdmin = '/administrador/homeAdmin';
  static const String rutasAdmin = '/administrador/rutasAdmin';
  static const String tareasAdmin = '/administrador/tareasAdmin';
  static const String gestionUserAdmin = '/administrador/gestionUserAdmin';

  // Rutas Ciudadano
  static const String perfilCiudadano = '/ciudadano/perfilCiudadano';
  static const String rutasCiudadano = '/ciudadano/rutasCiudadano';
  static const String encuestasCiudadano = '/ciudadano/encuestasCiudadano';

  // Rutas Recolector
  static const String homeRecolector = '/recolector/homeRecolector';
  static const String rutasRecolector = '/recolector/rutasRecolector';
}
