import 'package:iyzi_dart/models/iyzi_billing.dart';

extension BillingExt on IyziBilling {
  Map<String, String> get toMap =>
      {'address': address, 'contactName': contactName, 'city': city, 'country': country};
}
