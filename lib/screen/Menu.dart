import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    print('Ícono de configuración presionado');
                  },
                  icon: Icon(Icons.settings, size: 40),
                ),
                SizedBox(width: 16), 
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...', // Texto de placeholder
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        
                        ), // Borde del input
                      prefixIcon: Icon(Icons.search), // Ícono de lupa a la izquierda
                    ),
                  ),
                ),
                // Espacio entre el input y el ícono de notificaciones
                SizedBox(width: 16), // Espacio de 16 píxeles
                // Ícono de notificaciones
                IconButton(
                  onPressed: () {
                    print('Ícono de notificaciones presionado');
                  },
                  icon: Icon(Icons.notifications, size: 40),
                ),
                // Espacio entre el ícono de notificaciones y el ícono de perfil
                SizedBox(width: 16), // Espacio de 16 píxeles
                // Ícono de perfil
                IconButton(
                  onPressed: () {
                    print('Ícono de perfil presionado');
                  },
                  icon: Icon(Icons.person, size: 40),
                ),
              ],
            ),
            // Espacio entre la fila y la imagen
            SizedBox(height: 20), // Espacio de 20 píxeles
            // Imagen debajo de la fila
            Image.asset(
              'assets/images/Arog.png', // URL de la imagen
              width: 1500,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.green,
              thickness: 2,
              height: 20,
            ),
           Expanded(
  child: ListView(
    children: [
      _buildCardRow([
        _buildCard(Icons.map_outlined, 'Rutas', () {
          print('Card de Rutas presionada');
          // Aquí puedes navegar a otra pantalla o ejecutar una acción
        }),
        _buildCard(Icons.assignment_outlined, 'Tareas', () {
          print('Card de Tareas presionada');
        }),
         _buildCard(Icons.assignment_late, 'Registro de incidencias', () {
          print('Card de Registro de incidencias presionada');
        }),
      ]),
      SizedBox(height: 10),
      _buildCardRow([
        _buildCard(Icons.app_registration, 'Registros', () {
          print('Card de Registros presionada');
        }),
        _buildCard(Icons.history, 'Historial de Registro', () {
          print('Card de Historial de Registro presionada');
        }),
        _buildCard(Icons.monetization_on, 'Pagos', () {
          print('Card de Pagos presionada');
        }),
      ]),
      SizedBox(height: 10),
      _buildCardRow([
       _buildCard(Icons.photo_library, 'Galeria', () {
          print('Card de Galeria presionada');
        }),
        _buildCard(Icons.fact_check, 'Informes y Certificados', () {
          print('Card de Informes y Certificados presionada');
        }),
         _buildCard(Icons.bar_chart, 'Estadisticas y Metricas', () {
          print('Card de Estadisticas y Metricas presionada');
        }),
      ]),
    
    ],
  ),
),
          ],
        ),
      ),
    );
  }

  // Método para construir una fila de cards
  Widget _buildCardRow(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cards,
    );
  }

  // Método para construir una card
  Widget _buildCard(IconData icon, String text, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed, // Acción al presionar la card
    child: Container(
      width: 140,
      height: 160,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.green),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}