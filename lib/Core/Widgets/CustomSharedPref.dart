import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPref {
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    var shared = await SharedPreferences.getInstance();
    return shared.setString(key, value);
  }

  static Future<Object?> getData({required String key}) async {
    var shared = await SharedPreferences.getInstance();
    return shared.getString(key);
  }
}
