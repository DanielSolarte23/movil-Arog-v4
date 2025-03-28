import 'dart:convert';
import 'package:http/http.dart' as http;

class RegistrarController {
  final String baseUrl = "https://backend-arog-v4.onrender.com";

  Future<http.Response?> RegistrarUsu(
    String Nombres,
    String Apellidos,
    String password,
    String Correo,
    String Telefono,
  ) async {
    final url = Uri.parse('$baseUrl/api/auth/registro');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode({
          'Nombres': Nombres,
          'Apellidos': Apellidos,
          'Correo': Correo,
          'Telefono': Telefono,
          'password': password,
        }),
      );

      return response;
    } catch (e) {
      print('Error en la petición HTTP: $e');
      return null; 
    }
  }

  Future<Map<String, dynamic>> LoginUsu(
    String Correo,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/api/auth/inicio');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode({
          'Correo': Correo,
          'password': password,
        }),
      );

      Map<String, dynamic> responseData;
      try {
        responseData = jsonDecode(response.body);
      } catch (e) {
        return {
          'success': false,
          'mensaje': 'Error al procesar la respuesta del servidor',
        };
      }

      if (response.statusCode == 200) {
        return {
          'success': true, 
          'mensaje': responseData['mensaje'] ?? 'Inicio de sesión exitoso',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'mensaje': responseData['mensaje'] ?? 'Error: ${response.statusCode}',
        };
      }
    } catch (e) {
      print('Error en la petición HTTP: $e');
      return {'success': false, 'mensaje': 'Error de conexión al servidor'};
    }
  }
}
