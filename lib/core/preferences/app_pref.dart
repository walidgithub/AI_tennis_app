import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String userLoggedIn = "userLoggedIn";
const String userEmail = "userEmail";
const String userName = "userName";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //login
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(userLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(userLoggedIn as String) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(userLoggedIn);
  }

  // user data
  // email
  Future<bool> setUserEmail(String key, String userEmail) async {
    return await _sharedPreferences.setString(key, userEmail);
  }

  String? getUserEmail(String key) {
    return _sharedPreferences.getString(key);
  }

  // name
  Future<bool> setUserName(String key, String userName) async {
    return await _sharedPreferences.setString(key, userName);
  }

  String? getUserName(String key) {
    return _sharedPreferences.getString(key);
  }
}
