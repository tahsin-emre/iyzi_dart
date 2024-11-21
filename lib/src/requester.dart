import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:iyzi_dart/models/iyzi_config.dart';

final class Requester {
  const Requester(this.config);
  final IyziConfig config;

  Future<http.Response> createRequest(Uri uri, String body) {
    final auth = authString(uri.path, body);
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-iyzi-rnd': config.randomKey,
      'Authorization': auth,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Header': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Accept': '*',
    };
    return http.post(uri, body: body, headers: headers);
  }

  String authString(String path, String bodyStr) {
    const hashKey = 'IYZWSv2';
    final payload = '$path$bodyStr';
    final dataToEncrypt = config.randomKey + payload;
    final hmacSha256 = Hmac(sha256, utf8.encode(config.secretKey));
    final enc = hmacSha256.convert(utf8.encode(dataToEncrypt));
    final authKey =
        'apiKey:${config.apiKey}&randomKey:${config.randomKey}&signature:$enc';
    final List<int> utf8Bytes = utf8.encode(authKey);
    final codeKey = base64Encode(utf8Bytes);
    return '$hashKey $codeKey';
  }
}
