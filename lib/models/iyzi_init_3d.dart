import 'dart:convert';
import 'package:iyzi_dart/enums/status.dart';

class IyziInit3D {
  late Status status;
  late DateTime date;
  late String conversationId;
  String? errorCode;
  String? errorMessage;
  String? paymentId;
  String? signature;
  String? threeDSHtmlContent;

  IyziInit3D.fromJson(String json) {
    var data = jsonDecode(json);
    status = data['status'] == 'success' ? Status.success : Status.failure;
    date = DateTime.fromMillisecondsSinceEpoch(data['systemTime']);
    conversationId = data['conversationId'];
    errorCode = data['errorCode'];
    errorMessage = data['errorMessage'];
    paymentId = data['paymentId'];
    signature = data['signature'];
    threeDSHtmlContent = data['threeDSHtmlContent'];
  }

  String convertHtml() {
    List<int> decodedBytes = base64.decode(threeDSHtmlContent ?? '');
    return utf8.decode(decodedBytes);
  }
}
