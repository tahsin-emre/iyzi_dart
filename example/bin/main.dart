import 'package:iyzi_dart/enums/item_types.dart';
import 'package:iyzi_dart/enums/status.dart';
import 'package:iyzi_dart/iyzi_dart.dart';
import 'package:iyzi_dart/models/iyzi_address.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';

void main() async {
  const String callBackUrl = 'https://api.tahsinemre.com/payCheck';
  const String baseUrl = 'https://sandbox-api.iyzipay.com/payment';
  const String apiKey = 'YOUR-API-KEY';
  const String secretKey = 'YOUR-SECRET-KEY';
  const String randomKey = 'RANDOMKEY';

  final config = IyziConfig(
    baseUrl: baseUrl,
    callBackUrl: callBackUrl,
    apiKey: apiKey,
    secretKey: secretKey,
    randomKey: randomKey,
  );

  final iyziDart = IyziDart(config);

  final card = IyziCard(
    cardHolderName: 'Tahsin Emre Telli',
    cvc: '000',
    expireMonth: '12',
    expireYear: '2030',
    cardNumber: '5400010000000004',
  );

  final basketItem = IyziBasketItem(
    id: 'itemID',
    price: '360.00',
    name: 'Turkish Lesson',
    category1: 'DIGITAL SERVICE',
    itemType: ItemTypes.VIRTUAL,
  );

  final billingAdress = IyziAddress(
    address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
    contactName: 'Tahsin Emre Telli',
    city: 'İstanbul',
    country: 'Türkiye',
    zipCode: '34732',
  );
  IyziBuyer buyer = IyziBuyer(
    id: 'userIdOnAuthenticationService',
    name: 'Tahsin Emre',
    surname: 'Telli',
    identityNumber: '11111111111',
    email: 'telli@tahsinemre.com',
    registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
    city: 'İzmir',
    country: 'Türkiye',
    ip: '193.140.25.34',
    gsmNumber: "+905350000000",
    registrationDate: "2013-04-21 15:12:09",
    lastLoginDate: "2024-11-23 12:43:35",
  );
  final initializeResponse = await iyziDart.initializePayment(
    conversationId: 'testConvID',
    card: card,
    buyer: buyer,
    billingAddress: billingAdress,
    shippingAddress: billingAdress,
    basketItems: [basketItem],
  );

  if (initializeResponse.status == Status.failure) {
    print(initializeResponse.errorMessage);
    return;
  }

  if (initializeResponse.status == Status.success) {
    // You have to show this html content to user
    print(initializeResponse.convertHtml());
  }

  // You have to catch paymentId and conversationData on callbackUrl
  const paymentId = '0123456';
  const conversationData = 'conversationData';
  String result = await iyziDart.completePayment(
    conversationId: 'testConvID',
    paymentId: paymentId,
    conversationData: conversationData,
    locale: 'tr',
  );
  print(result);
}
