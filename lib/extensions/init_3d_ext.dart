import 'package:iyzi_dart/models/iyzi_init_3d.dart';

extension Init3DExt on IyziInit3D {
  Map<String, String> get toMap => {
        'status': status.name,
        'date': date.toString(),
        'conversationId': conversationId,
        'errorCode': errorCode ?? '',
        'errorMessage': errorMessage ?? '',
        'paymentId': paymentId ?? '',
        'signature': signature ?? '',
        'threeDSHtmlContent': threeDSHtmlContent ?? '',
      };
}
