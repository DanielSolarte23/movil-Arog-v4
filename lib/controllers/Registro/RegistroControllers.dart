import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/Registro/RespuestasEnviar.dart';

class FormularioEnvioController {
  static const String baseUrl =
      'https://backend-arog-v4.onrender.com/api/formularios';

  Future<bool> enviarFormulario(RespuestaFormulario respuesta) async {
    final url = Uri.parse(
      '$baseUrl',
    ); // Asegúrate de que sea la ruta correcta del POST
    final headers = {'Content-Type': 'application/json'};

    final body = json.encode(respuesta.toJson());
    // 2. Imprimir el JSON antes de enviarlo para depurar
    print("Formulario JSON a enviar: $body");

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true; // éxito
      } else {
        print('Error en el servidor: ${response.statusCode}');
        print('Respuesta del servidor: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error al enviar el formulario: $e');
      return false;
    }
  }
}
