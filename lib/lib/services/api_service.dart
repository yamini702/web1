import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000";

  static Future<bool> registerUser({
    required String userId,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": userId,
          "phone": phone,
          "email": email,
          "password": password,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print("API Error: $e");
      return false;
    }
  }
}
