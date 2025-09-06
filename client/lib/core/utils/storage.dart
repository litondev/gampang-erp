import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';


class StorageService {
  static final storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    // iOS options
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
    // Web options → PENTING supaya persisten
    webOptions: WebOptions(
      dbName : 'FlutterEncryptedStorage',
      publicKey : 'FlutterSecureStorage',
    ),
  );

  static Future<void> write(String key, String value) => storage.write(key: key, value: value);
  static Future<String?> read(String key) => storage.read(key: key);
}
