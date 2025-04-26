import 'package:flutter/material.dart';
import 'package:arog_movil/screen/Notificaciones.dart';
import 'package:arog_movil/screen/Header.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _mostrarNotificaciones() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const NotificacionesModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      header: _buildHeader(),
      content: _buildCardSections(),
      onNotifications: _mostrarNotificaciones,
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(4, 4),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/Arog.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Menu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCardSections() {
    return ListView(
      children: [
        _buildCardRow([
          _buildCard(Icons.map_outlined, 'Rutas', () => print('Card de Rutas presionada')),
          _buildCard(Icons.assignment_outlined, 'Tareas', () => print('Card de Tareas presionada')),
          _buildCard(Icons.assignment_late, 'Registro de incidencias', () => print('Card de Registro de incidencias presionada')),
        ]),
        const SizedBox(height: 10),
        _buildCardRow([
          _buildCard(Icons.app_registration, 'Registros', () => print('Card de Registros presionada')),
          _buildCard(Icons.history, 'Historial de Registro', () => print('Card de Historial de Registro presionada')),
          _buildCard(Icons.monetization_on, 'Pagos', () => print('Card de Pagos presionada')),
        ]),
        const SizedBox(height: 10),
        _buildCardRow([
          _buildCard(Icons.photo_library, 'Galeria', () => print('Card de Galeria presionada')),
          _buildCard(Icons.fact_check, 'Informes y Certificados', () => print('Card de Informes y Certificados presionada')),
          _buildCard(Icons.bar_chart, 'Estadísticas y Métricas', () => print('Card de Estadísticas y Métricas presionada')),
        ]),
      ],
    );
  }

  Widget _buildCardRow(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cards,
    );
  }

  Widget _buildCard(IconData icon, String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
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
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
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
