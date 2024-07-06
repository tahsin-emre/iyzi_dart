import 'dart:convert';

import 'package:iyzi_dart/enums/status.dart';

class BinDart {
  late Status status;
  late DateTime date;
  late String conversation;
  late String binNumber;
  String? errorCode;
  String? errorMessage;
  String? cardType;
  String? cardAssociation;
  String? cardFamily;
  String? bankName;
  int? bankCode;
  int? commercial;

  BinDart.fromJson(String json) {
    var data = jsonDecode(json);
    status = data['status'] == 'success' ? Status.success : Status.failure;
    date = DateTime.fromMillisecondsSinceEpoch(data['systemTime']);
    binNumber = data['binNumber'];
    conversation = data['conversationId'];
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
