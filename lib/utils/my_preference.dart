import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

getStringValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

addBoolToSF(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

getBoolValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}
