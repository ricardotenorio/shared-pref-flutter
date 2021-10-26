

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  
  add(String key, value) async {
    _getSharedPreferencesInstance().setString(key, value);
  }

  read(String key) async {
    return json.decode
      (
        _getSharedPreferencesInstance()
        .getString(key)
        .toString()
      );
  }

  remove(String key) async {
    _getSharedPreferencesInstance().remove(key);
  }

  _getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

}