import 'package:iyzi_dart/models/iyzi_address.dart';

extension AddressExt on IyziAddress {
  Map<String, String> get toMap => {
        'address': address,
        'zipCode': zipCode,
        'contactName': contactName,
        'city': city,
        'country': country,
      };
}
