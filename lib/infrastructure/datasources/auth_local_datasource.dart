import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/services/services.dart';

import '../dtos/dtos.dart';

/// A local data source for authentication-related data.
@lazySingleton
class AuthLocalDatasource {
  final SecureStorageService _storage;

  AuthLocalDatasource(this._storage);

  /// Deletes all authentication-related data.
  Future<void> delete() async => await _storage.deleteAll();

  /// Retrieves the authenticated user's data from local storage.
  ///
  /// Returns `null` if there is no user data stored locally.
  Future<UserDto?> getUser() async {
    // Retrieve the user data from secure storage.
    String? jsonString = await _storage.read(AppKeys.authUser);

    // If there's no user data stored, return null.
    if (jsonString == null) {
      return null;
    }
    // Otherwise, decode the JSON string into a UserDto object.
    else {
      return UserDto.fromJson(jsonDecode(jsonString));
    }
  }

  /// Stores the authenticated user's data in local storage.
  ///
  /// [dto] - the user data to store
  Future<void> storeUser(UserDto? dto) async {
    // Encode the UserDto object into a JSON string.
    final encodedString = jsonEncode(dto?.toJson());

    // Store the JSON string in secure storage.
    await _storage.write(key: AppKeys.authUser, value: encodedString);
  }
}
