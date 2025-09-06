import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage{
  static const FlutterSecureStorage Secure = FlutterSecureStorage(
      aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    // iOS options
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
    // Web options → PENTING supaya persisten
    webOptions: WebOptions(
      dbName : 'flutter_encrypted_storage',
    ),
  );
}