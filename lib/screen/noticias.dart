import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTopBar(),
            SizedBox(height: 20),
            _buildHeader(),
            Divider(color: Colors.green, thickness: 2, height: 20),
            SizedBox(height: 30),
            _buildCard(),
          ],
        ),
      ),
    );
  }

  // Método para construir la barra superior
  Widget _buildTopBar() {
    return Row(
      children: [
        _buildIconButton(Icons.settings, 'Ícono de configuración presionado'),
        SizedBox(width: 16),
        _buildSearchField(),
        SizedBox(width: 16),
        _buildIconButton(Icons.notifications, 'Ícono de notificaciones presionado'),
        SizedBox(width: 16),
        _buildIconButton(Icons.person, 'Ícono de perfil presionado'),
      ],
    );
  }

  // Método para construir el campo de búsqueda
  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.lightGreen, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.lightGreen, width: 2),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  // Método para construir un iconButton reutilizable
  Widget _buildIconButton(IconData icon, String logMessage) {
    return IconButton(
      onPressed: () {
        print(logMessage);
      },
      icon: Icon(
        icon,
        size: 40,
        color: Colors.lightGreen,
      ),
    );
  }

  // Método para construir el encabezado
  Widget _buildHeader() {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            'assets/images/Arog.png',
            width: MediaQuery.of(context).size.width * 0.9, // 90% del ancho de la pantalla
            height: MediaQuery.of(context).size.width * 0.5, // 50% del ancho de la pantalla
            fit: BoxFit.contain, // Ajusta la imagen sin recortes
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Noticias',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ClipRRect(
          child: Image.asset(
            'assets/images/Noticias.png',
            width: MediaQuery.of(context).size.width * 0.9, // 90% del ancho de la pantalla
            height: MediaQuery.of(context).size.width * 0.5, // 50% del ancho de la pantalla
            fit: BoxFit.contain, // Ajusta la imagen sin recortes
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Menu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }

  // Método para construir las cards
  Widget _buildCard() {
    return Expanded(
      child: ListView(
        children: [
          _buildCardRow([ 
            _buildCardItem(Icons.map_outlined, 'Rutas', () {
              print('Card de Rutas presionada');
            }),
            _buildCardItem(Icons.assignment_outlined, 'Tareas', () {
              print('Card de Tareas presionada');
            }),
            
          ]),
        ],
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

  // Método para construir una card individual
  Widget _buildCardItem(IconData icon, String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed, // Acción al presionar la card
      child: Container(
        width: 120,
        height: 150,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.green),
                SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
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
