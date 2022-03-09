import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rentomate/model/user_model.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = PUser(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Hemang Singh',
    email: 'hs142001@gmail.com',
    about:
        'Student, Pursuing B.E From BMS College Of Engineering!!',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(PUser user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static PUser getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : PUser.fromJson(jsonDecode(json));
  }
}
