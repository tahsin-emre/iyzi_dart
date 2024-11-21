import 'dart:convert';
import 'package:iyzi_dart/enums/status.dart';

class IyziInitResponse {
  IyziInitResponse.fromJson(String json) {
    final data = jsonDecode(json) as Map<String, dynamic>;
    status = data['status'] == 'success' ? Status.success : Status.failure;
    date = DateTime.fromMillisecondsSinceEpoch(data['systemTime'] as int);
    conversationId = data['conversationId'] as String;
    errorCode = data['errorCode'] as String?;
    errorMessage = data['errorMessage'] as String?;
    paymentId = data['paymentId'] as String?;
    signature = data['signature'] as String?;
    threeDSHtmlContent = data['threeDSHtmlContent'] as String?;
  }

  late Status status;
  late DateTime date;
  late String conversationId;
  String? errorCode;
  String? errorMessage;
  String? paymentId;
  String? signature;
  String? threeDSHtmlContent;

  String convertHtml() {
    final List<int> decodedBytes = base64.decode(threeDSHtmlContent ?? '');
    return utf8.decode(decodedBytes);
  }
}
