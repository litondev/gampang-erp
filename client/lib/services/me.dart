import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class MeService {
  /// Mengambil data user (/me) dari API
  Future<ModelUser?> getMe() async {
    try {
      print("ahlasd");
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      print("asd");
      
      if (token == null) {
        print("Token tidak ditemukan");
        return null;
      }

      print("Asd11");

      final url = Uri.parse((dotenv.env['API_URL'] ?? "") + "/me");
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token, // pakai token dari SharedPreferences
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ModelUser(
          id: data['id'],
          username: data['username'],
          fullname: data['fullname'],
        );
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error getMe: $e");
      return null;
    }
  }
}
