import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PoliticasScreen(),
    );
  }
}

class PoliticasScreen extends StatefulWidget {
  @override
  _PoliticasScreenState createState() => _PoliticasScreenState();
}

class _PoliticasScreenState extends State<PoliticasScreen> {
  bool aceptoCondiciones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Espacio para el logo
          Center(
            child: Image.asset(
              "assets/images/logo_arog.png", 
              height: 100,
            ),
          ),
          SizedBox(height: 20),
          // Contenedor con las políticas
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Nuestras Políticas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Est fugiat assumenda aut reprehenderit"),
                  SizedBox(height: 10),
                  // Cuadro con scroll y barra visible
                  Scrollbar(
                    thumbVisibility: true,
                    child: SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                          "\n\n1. Ea voluptates omnis aut sequi sequi."
                          "\n2. Est dolore quae in aliquid ducimus et autem repellendus."
                          "\n3. Aut ipsum Quis qui porro quasi aut minus placeat!"
                          "\n4. Sit consequatur neque ab vitae facere.",
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: aceptoCondiciones,
                        onChanged: (bool? value) {
                          setState(() {
                            aceptoCondiciones = value ?? false;
                          });
                        },
                      ),
                      Text("He leído todas las condiciones"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: aceptoCondiciones ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      disabledBackgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text("Aceptar", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
