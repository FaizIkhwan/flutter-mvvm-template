import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  // Key
  final String _appToken = "app_token";

  static Future<SharedPreferencesService?> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  String get appToken {
    return _preferences?.getString(_appToken) ?? "";
  }
  set appToken(String value) {
    _preferences?.setString(_appToken, value);
  }
}