import 'dart:convert';

import 'package:iyzi_dart/models/bin_dart.dart';
import 'package:iyzi_dart/models/iyzi_config.dart';
import 'package:iyzi_dart/src/requester.dart';

class IyziDart {
  IyziConfig config;
  IyziDart(this.config);

  Future<BinDart> binCheck(String bin, String conv) async {
    Requester requester = Requester(config);
    Uri uri = Uri.parse('${config.baseUrl}/bin/check');
    String body = jsonEncode({'locale': 'tr', 'binNumber': bin, 'conversationId': conv});
    var response = await requester.createRequest(uri, body);
    return BinDart.fromJson(response.body);
  }
}
