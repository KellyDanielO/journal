import 'package:shared_preferences/shared_preferences.dart';

class AppHandler {
  void saveGender(String gender) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
  }
  void saveLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  Future<String?> getGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? gender = prefs.getString('gender');
    return gender;
  }

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? language = prefs.getString('language');
    return language;
  }
}
