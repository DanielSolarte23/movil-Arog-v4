import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Importamos el controlador y modelo que creaste
import '../../controllers/Registro/listarRegistro.dart';
import '../../Models/Registro/RegistroOperario.dart';

// importamos el formulario dinamico que se debe abrir al seleccionar una card
import '../../views/administrador/FormularioDinamico.dart';

// Widget principal que lista todos los formularios
class ListarFormulario extends StatefulWidget {
  const ListarFormulario({super.key});

  @override
  State<ListarFormulario> createState() => _ListarFormularioState();
}

class _ListarFormularioState extends State<ListarFormulario> {
  late Future<List<Formulario>> _formulariosFuture;
  final FormularioController _controller = FormularioController();

  @override
  void initState() {
    super.initState();
    // Al iniciar, pedimos al backend los formularios
    _formulariosFuture = _controller.obtenerFormularios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formularios disponibles')),
      body: FutureBuilder<List<Formulario>>(
        future: _formulariosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Si aún está cargando, muestra spinner
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si hay error, lo muestra
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Si no hay formularios, muestra mensaje
            return const Center(child: Text('No hay formularios disponibles'));
          }

          final formularios = snapshot.data!;

          // Widget que permite hacer "pull to refresh"
          return RefreshIndicator(
            onRefresh: () async {
              // Al recargar, vuelve a llamar al backend
              setState(() {
                _formulariosFuture = _controller.obtenerFormularios();
              });
            },
            child: ListView.builder(
              itemCount: formularios.length,
              itemBuilder: (context, index) {
                final formulario = formularios[index];

                // Se crea una tarjeta por cada formulario
                return FormularioCard(
                  nombre: formulario.nombre,
                  fecha: formulario.fechaCreacion,
                  onTap: () async {
                    final formularioCompleto = await _controller
                        .obtenerFormularioPorId(formulario.id);

                    // Mostrar el formulario en un modal
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 23,
                          ), // Ajusta el padding horizontal
                          title: Text(
                            formularioCompleto.nombre,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: FormularioDinamico(
                              campos: formularioCompleto.campos,
                              nombreFormulario: formularioCompleto.nombre,
                              formularioTipoId: formularioCompleto.formularioTipoId,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Widget reutilizable que representa una tarjeta de formulario a registrar
class FormularioCard extends StatelessWidget {
  final String nombre;
  final DateTime fecha;
  final VoidCallback onTap;

  const FormularioCard({
    super.key,
    required this.nombre,
    required this.fecha,
    required this.onTap,
  });

  // Formatea la fecha al estilo "dd/MM/yyyy"
  String formatearFecha(DateTime fecha) {
    return DateFormat('dd/MM/yyyy').format(fecha);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <- Ejecuta la función cuando se toca
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabecera con ícono + nombre del formulario
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.description,
                        color: Colors.green,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        nombre,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.grey),
                ],
              ),

              const Divider(height: 24),

              // Pie con la fecha de creación
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatearFecha(fecha),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text('Creado', style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
