import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String userLoggedIn = "userLoggedIn";
const String userEmail = "userEmail";
const String userPhone = "userPhone";
const String userName = "userName";
const String userPhotoUrl = "photoUrl";

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

  // phone
  Future<bool> setUserPhone(String key, String userPhone) async {
    return await _sharedPreferences.setString(key, userPhone);
  }

  String? getUserPhone(String key) {
    return _sharedPreferences.getString(key);
  }

  // photoUrl
  Future<bool> setUserPhotoUrl(String key, String userPhotoUrl) async {
    return await _sharedPreferences.setString(key, userPhotoUrl);
  }

  String? getUserPhotoUrl(String key) {
    return _sharedPreferences.getString(key);
  }
}
