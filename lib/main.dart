 b   import 'package:flutter/material.dart';

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
      home: const MyApp(),
    );
  }
}
