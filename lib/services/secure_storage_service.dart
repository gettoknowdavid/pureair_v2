import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A service that provides secure storage for sensitive data using FlutterSecureStorage.
///
/// The service supports read, write, delete, and deleteAll operations for a given key.
/// FlutterSecureStorage is used under the hood with the options to use encryptedSharedPreferences set to true on Android.
class SecureStorageService {
  final _secure = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// Deletes the value associated with the given [key].
  Future<void> delete(String key) async => await _secure.delete(key: key);

  /// Deletes all values stored in the secure storage.
  Future<void> deleteAll() async => await _secure.deleteAll();

  /// Reads the value associated with the given [key].
  ///
  /// Returns the value if present, or null if the key is not found.
  Future<String?> read(String key) async => await _secure.read(key: key);

  /// Writes the given [value] to the secure storage associated with the given [key].
  Future<void> write({required String key, required String? value}) async {
    await _secure.write(key: key, value: value);
  }
}
