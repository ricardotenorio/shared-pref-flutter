import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  
  add(String key, value) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(key, value);
  }

  Future<List<dynamic>> read(String key) async {
    final preferences = await SharedPreferences.getInstance();

    return json.decode
      (
        preferences
        .getString(key)
        .toString()
      );
  }

  remove(String key) async {
    final preferences = await SharedPreferences.getInstance();
    
    preferences.remove(key);
  }

}