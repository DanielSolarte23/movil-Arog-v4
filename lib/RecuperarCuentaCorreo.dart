import 'package:flutter/material.dart';
import 'RecuperarCuenta.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecuperarCuentacorreo(),
  ));
}

class RecuperarCuentacorreo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_arog.png',
              width: 150,
            ),
            SizedBox(height: 20),

            Text(
              'Recupera tu cuenta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
       Align(
        alignment: Alignment.centerLeft,
        child: Text('Ingresa tu correo electrónico.')),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),

            Text(
              'Podemos enviarte notificaciones por WhatsApp y SMS con fines de seguridad e inicio de sesión',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text('Continuar', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),

            // BOTÓN QUE NAVEGA A RECUPERAR CUENTA POR NÚMERO
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecuperarCuenta()),
                );
              },
              child: Text('Buscar por número de teléfono', style: TextStyle(color: Colors.green)),
            ),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text('Cancelar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}