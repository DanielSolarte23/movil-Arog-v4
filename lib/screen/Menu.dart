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
      backgroundColor: Colors.white, // Fondo blanco
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          children: [
            _buildTopBar(),
            SizedBox(height: 20),
            _buildHeader(),
            Divider(color: Colors.green, thickness: 2, height: 20),
            SizedBox(height: 30),
            _buildCardSections(),
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
        _buildSearchField(), // Campo de búsqueda con sombra
        SizedBox(width: 16),
        _buildIconButton(Icons.notifications, 'Ícono de notificaciones presionado'),
        SizedBox(width: 16),
        _buildIconButton(Icons.person, 'Ícono de perfil presionado'),
      ],
    );
  }

  // Método para construir el campo de búsqueda con BoxShadow
  Widget _buildSearchField() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Color de la sombra
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Desplazamiento de la sombra
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none, // Sin borde, solo sombra
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none, // Sin borde
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.lightGreen, width: 2),
            ),
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white, // Fondo blanco para el input
          ),
        ),
      ),
    );
  }

  // Método para construir un IconButton reutilizable
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
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/Arog.png',
            width: double.infinity, // Se ajusta al 100% del ancho disponible
            height: MediaQuery.of(context).size.width * 0.5, // 50% del ancho de la pantalla
            fit: BoxFit.contain, // Ajusta la imagen para que se vea completa sin recortes
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Menu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Método para construir las secciones de las cards
  Widget _buildCardSections() {
    return Expanded(
      child: ListView(
        children: [
          _buildCardRow([ 
            _buildCard(Icons.map_outlined, 'Rutas', () {
              print('Card de Rutas presionada');
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
