import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:arog_movil/screen/Header.dart'; // Tu CustomLayout
import 'package:arog_movil/screen/Notificaciones.dart';

class Tareas extends StatefulWidget {
  const Tareas({super.key});

  @override
  State<Tareas> createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  String valorSeleccionado = 'Por hacer';
  final List<String> opciones = ['Por hacer', 'Completado', 'En progreso'];
  final PageController _pageController = PageController(viewportFraction: 0.35);
  final List<DateTime> fechas = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  bool localeCargado = false;

  @override
  void initState() {
    super.initState();
    _initLocale();
  }

  Future<void> _initLocale() async {
    await initializeDateFormatting('es_ES', null);
    setState(() {
      localeCargado = true;
    });
  }

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
    if (!localeCargado) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return CustomLayout(
      header: _buildHeader(),
      content: _buildContent(),
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
          'Tareas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 24, color: Colors.lightGreen),
            const SizedBox(width: 10),
            Expanded(child: _buildDropdown()),
          ],
        ),
        const SizedBox(height: 20),
        _buildCarruselFechas(),
        // Aquí puedes seguir añadiendo más contenido debajo
      ],
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: valorSeleccionado,
      items: opciones.map((opcion) {
        return DropdownMenuItem<String>(
          value: opcion,
          child: Text(opcion),
        );
      }).toList(),
      onChanged: (nuevoValor) {
        setState(() {
          valorSeleccionado = nuevoValor!;
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildCarruselFechas() {
    return SizedBox(
      height: 90,
      child: PageView.builder(
        controller: _pageController,
        itemCount: fechas.length,
        itemBuilder: (context, index) {
          final fecha = fechas[index];
          final formatter = DateFormat.EEEE('es_ES').add_d().add_MMM();
          final textoFecha = formatter.format(fecha);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  textoFecha,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
