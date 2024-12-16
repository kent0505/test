import 'package:shared_preferences/shared_preferences.dart';

bool onboard = true;

Future<void> getPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  // await prefs.clear();
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveOnboard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}
