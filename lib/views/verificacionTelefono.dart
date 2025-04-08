import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Verificacion(),
    );
  }
}

class Verificacion extends StatefulWidget {
  @override
  _VerificacionState createState() => _VerificacionState();
}

class _VerificacionState extends State<Verificacion> {
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "assets/images/logo_arog.png",
              height: 120,
            ),
            SizedBox(height: 10),

            // Texto "Verificación"
            Text(
              "Verificación",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Mensaje informativo
            Text(
              "Hemos enviado un código de verificación al número 312********, introduce el código para recuperar tu cuenta.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),

            // Enlace para cambiar número
            GestureDetector(
              onTap: () {
                print("Cambiar número presionado");
              },
              child: Text(
                "cambiar el número",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Campo de entrada
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Código",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),

            // Botón de verificar
            ElevatedButton(
              onPressed: () {
                print("Código ingresado: ${_codeController.text}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              ),
              child: Text("Verificar", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),

            // Texto "¿No has recibido el código?"
            GestureDetector(
              onTap: () {
                print("Reenviar código presionado");
              },
              child: Text(
                "¿No has recibido el código?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
