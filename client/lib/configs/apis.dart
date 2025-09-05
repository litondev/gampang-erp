import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApis {
  static String get baseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get apiAssetUrl => dotenv.env['API_ASSET_URL'] ?? '';

  static Map<String, String> headers(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}