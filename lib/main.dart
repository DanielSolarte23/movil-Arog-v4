import 'package:arog_movil/views/GaleriaAdmin.dart';
import 'package:arog_movil/views/GaleriaRecolector.dart';
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
      title: 'Galería de Fotos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Galeriarecolector (),
    );
  }
}


