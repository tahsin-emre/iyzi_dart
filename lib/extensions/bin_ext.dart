import 'package:iyzi_dart/models/iyzi_bin.dart';

extension BinExt on IyziBin {
  Map<String, String> get toMap => {
        'status': status.name,
        'date': date.toString(),
        'conversationId': conversationId,
        'binNumber': binNumber,
        'errorCode': errorCode ?? '',
        'errorMessage': errorMessage ?? '',
        'cardType': cardType ?? '',
        'cardAssociation': cardAssociation ?? '',
        'cardFamily': cardFamily ?? '',
        'bankName': bankName ?? '',
        'bankCode': bankCode?.toString() ?? '',
        'commercial': commercial?.toString() ?? ''
      };
}
