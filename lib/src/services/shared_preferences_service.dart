import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class SharedPreferencesService {
  static late SharedPreferencesService _instance;
  static late SharedPreferences _pref;

  bool get isInitialStartup {
    if (_pref.containsKey(AppKeys.initKey)) {
      return false;
    } else {
      return true;
    }
  }

  Future delete(String key) async {
    return await _pref.remove(key);
  }

  bool hasKey(String key) => _pref.containsKey(key);

  dynamic read(String key) {
    return _pref.get(key);
  }

  dynamic readList(String key) {
    return _pref.getStringList(key);
  }

  Future write({required String key, required dynamic value}) async {
    if (value is bool) {
      _pref.setBool(key, value);
    } else if (value is String) {
      _pref.setString(key, value);
    } else if (value is int) {
      _pref.setInt(key, value);
    } else if (value is double) {
      _pref.setDouble(key, value);
    }
  }

  Future writeList({required String key, required List<String> value}) async {
    await _pref.setStringList(key, value);
  }

  static Future<SharedPreferencesService> getInstance() async {
    _pref = await SharedPreferences.getInstance();
    _instance = SharedPreferencesService();

    return Future.value(_instance);
  }
}
