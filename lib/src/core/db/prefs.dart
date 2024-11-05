import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

Future<bool> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    bool onboard = prefs.getBool('onboard') ?? true;
    return onboard;
  } catch (e) {
    logger(e);
    return true;
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

Future<void> saveString(String key, String value) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  } catch (e) {
    logger(e);
  }
}

Future<void> saveInt(String key, int value) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  } catch (e) {
    logger(e);
  }
}

Future<void> saveBool(String key, bool value) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  } catch (e) {
    logger(e);
  }
}
