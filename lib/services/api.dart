

import 'package:http/http.dart' as http;
import 'package:said/models/article.dart';
import 'dart:convert';

import 'package:said/models/registrationRequest.dart';
import 'package:said/services/encoder.dart';
import 'package:said/services/storage.dart';

const String API_URL = "cms-said.herokuapp.com";

Future<List<Article>> fetchArticles() async {
  var response = await http.get(_buildUrl(path: '/articles'));

  if (response.statusCode == 200) {
    Iterable jsonList = json.decode(response.body);
    return jsonList.map((v) => Article.fromJson(v)).toList();
  } else {
    throw Exception('Failed to load articles.');
  }
}

Future postFeedback(String body) async {
  var response = await http.post(
    _buildUrl(path: '/app-feedbacks'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "feedback": body,
    }),
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception('Failed to post feedback');
  }
}

Future postStory(String body) async {
  var response = await http.post(
    _buildUrl(path: '/user-stories'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "story": body,
    }),
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception('Failed to post feedback');
  }
}

Future register(RegistrationRequest request) async {
  var response = await http.post(
    _buildUrl(path: '/application-users'),
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
    body: request.toJsonString(),
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception('Failed to register');
  }
}

Future<bool> login(String phone, String password) async {
  String expectedToken = encode(phone + ":" + password);

  var response = await http.get(_buildUrl(path: '/application-users'));

  if (response.statusCode == 200) {
    Iterable jsonList = json.decode(response.body);
    for (var user in jsonList) {
      if (user['token'] == expectedToken) {
        storeToken(expectedToken);
        return true;
      }
    }

    return false;
  } else {
    throw Exception('Failed to login.');
  }
}

_buildUrl({required String path, dynamic params}) =>
  Uri.http(API_URL, path);