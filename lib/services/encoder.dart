import 'dart:convert';

String encode(String str) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return stringToBase64.encode(str);
}