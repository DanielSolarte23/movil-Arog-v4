import 'package:arog_movil/views/homeAdmin.dart';
import 'package:arog_movil/widgets/pantalla_inicio.dart';
import 'package:flutter/material.dart';
import 'views/RecuperarCuenta.dart';
import 'package:arog_movil/views/politica.dart';

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
        '/movil-Arog-v4/lib/views/politica.dart':(context)=> PoliticasScreen(),
      },
    );
  }
}///movil-Arog-v4/lib/views/homeAdmin.dart