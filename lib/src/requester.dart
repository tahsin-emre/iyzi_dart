import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:iyzi_dart/models/iyzi_config.dart';

class Requester {
  IyziConfig config;
  Requester(this.config);

  Future<http.Response> createRequest(Uri uri, String body) {
    String auth = authString(uri.path, body);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-iyzi-rnd': config.randomKey,
      'Authorization': auth,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Header': '*',
      'Accept': '*',
    };
    return http.post(uri, body: body, headers: headers);
  }

  String authString(String path, String bodyStr) {
    String hashKey = 'IYZWSv2';
    String payload = '$path$bodyStr';
    String dataToEncrypt = config.randomKey + payload;
    var hmacSha256 = Hmac(sha256, utf8.encode(config.secretKey));
    var enc = hmacSha256.convert(utf8.encode(dataToEncrypt));
    String authKey =
        'apiKey:${config.apiKey}&randomKey:${config.randomKey}&signature:$enc';
    List<int> utf8Bytes = utf8.encode(authKey);
    String codeKey = base64Encode(utf8Bytes);
    return '$hashKey $codeKey';
  }
}
