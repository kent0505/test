import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

bool onboard = true;

Future<void> getPrefs() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    onboard = prefs.getBool('onboard') ?? true;
  } catch (e) {
    logger(e);
  }
}

Future<void> saveOnboard() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboard', false);
  } catch (e) {
    logger(e);
  }
}
