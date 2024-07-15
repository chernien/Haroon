import 'package:flutter/material.dart';
import 'Services/UserService.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserModel extends ChangeNotifier {
  String _email = '';
  String get email => _email;

  String _token = '';
  String get token => _token;

  final UserService _userService = UserService();

  Future<bool> login(String email, String password) async {
    try {
      final response = await _userService.login(email, password);
      print('Response from login API: $response'); // Vérifiez la réponse JSON ici

      // Vérifiez si 'token' existe dans la réponse JSON
      if (response.containsKey('token') && response['token'] != null) {
        _token = response['token'];

        // Décoder le token pour obtenir les informations utilisateur
        Map<String, dynamic> decodedToken = JwtDecoder.decode(_token);
        print('Decoded Token: $decodedToken'); // Affichez le contenu décodé du token

        if (decodedToken.containsKey('firstName')) {
          _email = decodedToken['firstName'];
        } else {
          print('Field "email" not found in token');
        }

        notifyListeners();
        return true;
      } else {
        print('Field "token" not found or null in API response');
        return false;
      }
    } catch (e) {
      print('Error logging in: $e'); // Capturez et examinez les erreurs ici
      return false;
    }
  }
}
