import 'package:iyzi_dart/models/iyzi_card.dart';

extension CardExt on IyziCard {
  Map<String, String> get toMap => {
        'cardHolderName': cardHolderName,
        'cardNumber': cardNumber,
        'expireYear': expireYear,
        'expireMonth': expireMonth,
        'cvc': cvc,
      };
}
