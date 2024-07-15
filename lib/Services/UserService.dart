import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Constantes.dart';

class UserService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(Constantes.apiUrl_users + '/authenticate'), // Utilisation de l'URL correcte pour l'authentification
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}