import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../core/utils/apis.dart';
import '../core/utils/formats.dart';
import '../models/user.dart';

class MeService {
  Future<ModelUser?> getMe() async {
    try {
      // TAMBAH SCRIPT
      final storage = const FlutterSecureStorage();

      String? token = await storage.read(key: "token");
      
      if (token == null) {
        print("Error : Token tidak ditemukan");
        return null;
      }

      final url = Uri.parse((dotenv.env['API_URL'] ?? "") + "/me");

      final response = await http.get(
        url,
        headers: UtilApis.headers(token),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        return ModelUser(
          id: data['id'],
          username: data['username'],
          fullname: data['fullname'],
        );
      } else {
        UtilFormats.formatPrintErrorHttp(response);
        return null;
      }

    } catch (e,stackTrace) {
      print("Error : $e");
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}
