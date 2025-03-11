import 'package:flutter/material.dart';
import 'package:arog_movil/views/verificacion.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquiler de vehiculos',
      home: Scaffold(
        body: VerificationScreen(),
      ),
    );
  }
}
