import 'package:iyzi_dart/iyzi_dart.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_billing.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';
import 'package:iyzi_dart/models/iyzi_init_3d.dart';

void main() async {
  const String callBackUrl = 'https://api.tahsinemre.com/payCheck';
  const String baseUrl = 'https://sandbox-api.iyzipay.com/payment';
  const String apiKey = 'YOUR-API-KEY';
  const String secretKey = 'YOUR-SECRET-KEY';
  IyziConfig config = IyziConfig(
    baseUrl,
    callBackUrl,
    apiKey,
    secretKey,
    'RANDOMKEY',
  );
  IyziDart iyziDart = IyziDart(config);
  IyziCard card = IyziCard(
    'Tahsin Emre Telli',
    '000',
    '12',
    '2030',
    '5400010000000004',
  );
  IyziBasketItem item = IyziBasketItem(
    'TurboTalkers',
    '360.00',
    'Turkish Lesson',
    'DIGITAL SERVICE',
    'VIRTUAL',
  );
  IyziBilling billing = IyziBilling(
    'Adatepe Mh. Doğuş Cd. No:207Z D:1 Buca/İzmir',
    'Tahsin Emre Telli',
    'İzmir',
    'İstanbul',
  );
  IyziBuyer buyer = IyziBuyer(
    'userIdOnAuthenticationService',
    'Tahsin Emre',
    'Telli',
    '11111111111',
    'telli@tahsinemre.com',
    'Adatepe Mh. Doğuş Cd. No:207Z D:1 Buca/İzmir',
    'İzmir',
    'Türkiye',
    '193.140.25.34',
  );
  IyziInit3D init3d = await iyziDart.init3D(
    'testConvID',
    'USD',
    card,
    buyer,
    billing,
    [item],
  );
  print(init3d.toMap);
  print('%%%%%%%%%%%%%');
  print(init3d.convertHtml());

  // //You have to catch paymentId and conversationData on callbackUrl
  const String paymentId = '0123456';
  const String conversationData = 'conversationData';
  String result = await iyziDart.complete3D(
    'testConvID',
    paymentId,
    conversationData,
  );
  print(result);
}
