import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Constantes.dart';

class UserService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(Constantes.apiUrl_users + '/authenticate'),
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
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> register({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String birthDate,
    required String nationality,
    required String gender,
  }) async {
    final url = Uri.parse(Constantes.apiUrl_users + '/register');
    print('URL d\'inscription : $url');

    final body = jsonEncode(<String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'birthDate': birthDate, // Assurez-vous que birthDate est déjà en format ISO8601
      'nationality': nationality,
      'gender': gender,
      'role': 'User',
    });

    print('Body d\'inscription : $body');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    print('Réponse d\'inscription : ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }
}

