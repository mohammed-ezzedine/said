

import 'package:http/http.dart' as http;
import 'package:said/models/article.dart';
import 'dart:convert';

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

_buildUrl({required String path, dynamic params}) =>
  Uri.http(API_URL, path);