import 'package:flutter/material.dart';
import '../../Models/Registro/RegistroOperario.dart';
import '../../Models/Registro/RespuestasEnviar.dart';
import '../../Controllers/Registro/RegistroControllers.dart';

class FormularioDinamico extends StatefulWidget {
  final List<CampoFormulario> campos;
  final String nombreFormulario;
  final int formularioTipoId;

  const FormularioDinamico({
    super.key,
    required this.campos,
    required this.nombreFormulario,
    required this.formularioTipoId,
  });

  @override
  _FormularioDinamicoState createState() => _FormularioDinamicoState();
}

class _FormularioDinamicoState extends State<FormularioDinamico> {
  final Map<String, TextEditingController> _controladores = {};

  @override
  void initState() {
    super.initState();
    for (var campo in widget.campos) {
      _controladores[campo.nombre] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controladores.forEach((_, controlador) => controlador.dispose());
    super.dispose();
  }

  Widget _crearCampo(CampoFormulario campo) {
    String tipo = campo.tipo;
    String etiqueta = campo.nombre;
    String nombre = campo.nombre;

    TextInputType teclado;

    switch (tipo) {
      case 'numero':
        teclado = TextInputType.number;
        break;
      case 'email':
        teclado = TextInputType.emailAddress;
        break;
      default:
        teclado = TextInputType.text;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _controladores[nombre],
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: etiqueta,
          labelStyle: TextStyle(
            color:
                Colors
                    .grey, // Color gris para la etiqueta cuando no está seleccionada
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF72AA00), width: 2.0),
          ),
          border: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF72AA00), width: 2.0),
          ),
        ),
        cursorColor: Color(0xFF72AA00), // Color del cursor
      ),
    );
  }

  void _enviarFormulario() async {
    final List<ValorCampoFormulario> valores = [];

    // Recorrer los campos del formulario
    widget.campos.forEach((campo) {
      final controlador = _controladores[campo.nombre];
      if (controlador != null) {
        // Crear una instancia de ValorCampoFormulario para cada campo
        valores.add(
          ValorCampoFormulario(
            campoFormularioId: campo.id,
            valor: controlador.text,
          ),
        );
      }
    });

    // Crear la instancia de RespuestaFormulario
    final respuesta = RespuestaFormulario(
      formularioTipoId: widget.formularioTipoId, // Corrección aquí
      titulo: widget.nombreFormulario,
      descripcion: 'Formulario enviado desde app Flutter',
      valores: valores,
    );

    // Usar el controlador para enviar el formulario
    final controller = FormularioEnvioController();
    final exito = await controller.enviarFormulario(respuesta);

    // Mostrar un mensaje dependiendo de si el formulario se envió exitosamente
    if (exito) {
      if (mounted) {
        Navigator.of(context).pop(); // Cierra el modal
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Formulario enviado con éxito')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar el formulario')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sección de campos del formulario con scroll solo para los campos
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [...widget.campos.map(_crearCampo).toList()],
                  ),
                ),
              ),
            ),
            // Los botones fuera del scroll
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botón Enviar
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF72AA00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radio de 10
                      ),
                    ),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20), // Espacio entre los botones
                  // Botón Cerrar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el modal
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radio de 10
                      ),
                    ),
                    child: const Text(
                      'Cerrar',
                      style: TextStyle(color: Color(0xFF333333)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
