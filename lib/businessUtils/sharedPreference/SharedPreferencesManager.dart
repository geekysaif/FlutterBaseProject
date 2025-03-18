import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  SharedPreferences _preferences;

  SharedPreferencesManager(this._preferences);



  // Singleton pattern
  // factory SharedPreferencesManager() {
  //   return _instance;
  // }



  // Save a string value
 void setString(String key, String value)  {
     _preferences?.setString(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Save a boolean value
  void setBool(String key, bool value)  {
     _preferences?.setBool(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Save an integer value
  Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Save a double value
  Future<void> setDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  // Get a double value
  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  // Remove a specific key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Clear all preferences
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
