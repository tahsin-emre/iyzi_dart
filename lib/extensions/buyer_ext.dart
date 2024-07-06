import 'package:iyzi_dart/models/iyzi_buyer.dart';

extension BuyerExt on IyziBuyer {
  Map<String, String> get toMap => {
        "id": id,
        "name": name,
        "surname": surname,
        "identityNumber": identityNumber,
        "email": email,
        "registrationAddress": registrationAddress,
        "city": city,
        "country": country,
        "ip": ip
      };
}
