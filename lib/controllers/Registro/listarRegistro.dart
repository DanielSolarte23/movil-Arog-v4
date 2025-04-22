import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/Registro/RegistroOperario.dart'; // Asegúrate de tener el path correcto

class FormularioController {
  static const String baseUrl = 'https://backend-arog-v4.onrender.com/api/formulariosTipo';

  Future<List<Formulario>> obtenerFormularios() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Formulario.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar formularios');
    }
  }

  Future<Formulario> obtenerFormularioPorId(int id) async {
  final url = '$baseUrl/$id';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return Formulario.fromJson(data);
  } else {
    throw Exception('Error al obtener el formulario con ID $id');
  }
}

}
