import 'package:iyzi_dart/models/bin_dart.dart';

extension BinExt on BinDart {
  Map<String, dynamic> get toMap => {
        'status': status,
        'date': date.toString(),
        'conversationId': conversationId,
        'binNumber': binNumber,
        'errorCode': errorCode,
        'errorMessage': errorMessage,
        'cardType': cardType,
        'cardAssociation': cardAssociation,
        'cardFamily': cardFamily,
        'bankName': bankName,
        'bankCode': bankCode,
        'commercial': commercial,
      };
}
