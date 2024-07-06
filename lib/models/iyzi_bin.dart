import 'dart:convert';

import 'package:iyzi_dart/enums/status.dart';

class IyziBin {
  late Status status;
  late DateTime date;
  late String conversationId;
  late String binNumber;
  String? errorCode;
  String? errorMessage;
  String? cardType;
  String? cardAssociation;
  String? cardFamily;
  String? bankName;
  int? bankCode;
  int? commercial;

  IyziBin.fromJson(String json) {
    var data = jsonDecode(json);
    status = data['status'] == 'success' ? Status.success : Status.failure;
    date = DateTime.fromMillisecondsSinceEpoch(data['systemTime']);
    conversationId = data['conversationId'];
    binNumber = data['binNumber'];
    errorCode = data['errorCode'];
    errorMessage = data['errorMessage'];
    cardType = data['cardType'];
    cardAssociation = data['cardAssociation'];
    cardFamily = data['cardFamily'];
    bankName = data['bankName'];
    bankCode = data['bankCode'];
    commercial = data['commercial'];
  }
}
