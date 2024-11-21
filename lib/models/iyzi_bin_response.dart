import 'dart:convert';

import 'package:iyzi_dart/enums/status.dart';

final class IyziBinResponse {
  IyziBinResponse({
    this.conversationId,
    this.binNumber,
    this.cardType,
    this.cardAssociation,
    this.cardFamily,
    this.bankName,
    this.commercial,
    this.bankCode,
    this.systemTime,
    this.status,
  });

  factory IyziBinResponse.fromJson(String json) {
    final data = jsonDecode(json) as Map<String, dynamic>;
    return IyziBinResponse(
      conversationId: data['conversationId'] as String?,
      binNumber: data['binNumber'] as String?,
      cardType: data['cardType'] as String?,
      cardAssociation: data['cardAssociation'] as String?,
      cardFamily: data['cardFamily'] as String?,
      bankName: data['bankName'] as String?,
      commercial: data['commercial'] as String?,
      bankCode: data['bankCode'] as int?,
      systemTime: data['systemTime'] as int?,
      status: data['status'] == 'success' ? Status.success : Status.failure,
    );
  }

  final String? conversationId;
  final String? binNumber;
  final String? cardType;
  final String? cardAssociation;
  final String? cardFamily;
  final String? bankName;
  final String? commercial;
  final int? bankCode;
  final int? systemTime;
  final Status? status;
}
