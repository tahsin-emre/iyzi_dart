import 'dart:convert';

import 'package:iyzi_dart/extensions/basket_item_ext.dart';
import 'package:iyzi_dart/extensions/billing_ext.dart';
import 'package:iyzi_dart/extensions/buyer_ext.dart';
import 'package:iyzi_dart/extensions/card_ext.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_billing.dart';
import 'package:iyzi_dart/models/iyzi_bin.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';
import 'package:iyzi_dart/models/iyzi_config.dart';
import 'package:iyzi_dart/models/iyzi_init_3d.dart';
import 'package:iyzi_dart/src/requester.dart';

class IyziDart {
  IyziConfig config;
  IyziDart(this.config);

  Future<IyziBin> binCheck(String bin, String conv) async {
    Requester requester = Requester(config);
    Uri uri = Uri.parse('${config.baseUrl}/bin/check');
    String body =
        jsonEncode({'locale': 'tr', 'binNumber': bin, 'conversationId': conv, 'price': 100});
    var response = await requester.createRequest(uri, body);
    print('response:${jsonDecode(response.body).toString().replaceAll(',', '\n')}');
    return IyziBin.fromJson(response.body);
  }

  Future<IyziInit3D> init3D(
    String conv,
    String currency,
    IyziCard card,
    IyziBuyer buyer,
    IyziBilling billing,
    List<IyziBasketItem> items,
  ) async {
    Requester requester = Requester(config);
    Uri uri = Uri.parse('${config.baseUrl}/3dsecure/initialize');
    num price = 0;
    for (var item in items) {
      price += num.tryParse(item.price) ?? 0;
    }
    String body = jsonEncode({
      'locale': 'tr',
      'conversationId': conv,
      'currency': currency,
      'callbackUrl': config.callBackUrl,
      'price': price.toStringAsFixed(2),
      'paidPrice': price.toStringAsFixed(2),
      'installment': 1,
      'paymentCard': card.toMap,
      'buyer': buyer.toMap,
      'billingAddress': billing.toMap,
      'basketItems': [...items.map((e) => e.toMap)],
    });
    var response = await requester.createRequest(uri, body);
    print('response:${jsonDecode(response.body).toString().replaceAll(',', '\n')}');
    return IyziInit3D.fromJson(response.body);
  }
}
