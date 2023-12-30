import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveWeatherData(String weatherData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('weatherData', weatherData);
  }

  static Future<String?> getWeatherData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('weatherData');
  }
}
