import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const DB_NAME = 'said.db';

Future storeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

Future<String?> readToken() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  final token = prefs.getString('token') ?? null;

  return token;
}