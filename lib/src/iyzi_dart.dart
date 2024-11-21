import 'dart:convert';

import 'package:iyzi_dart/extensions/basket_item_ext.dart';
import 'package:iyzi_dart/extensions/buyer_ext.dart';
import 'package:iyzi_dart/extensions/card_ext.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';
import 'package:iyzi_dart/models/iyzi_config.dart';
import 'package:iyzi_dart/models/iyzi_init_3d.dart';
import 'package:iyzi_dart/src/requester.dart';

final class IyziDart {
  const IyziDart(this.config);
  final IyziConfig config;

  // Future<IyziBin> binCheck(String bin, String conv) async {
  //   final requester = Requester(config);
  //   final uri = Uri.parse('${config.baseUrl}/bin/check');
  //   final body = jsonEncode({
  //     'locale': 'tr',
  //     'binNumber': bin,
  //     'conversationId': conv,
  //     'price': 100,
  //   });
  //   final response = await requester.createRequest(uri, body);
  //   return IyziBin.fromJson(response.body);
  // }

  Future<IyziInit3D> init3D(
    String conv,
    String currency,
    IyziCard card,
    IyziBuyer buyer,
    // IyziBilling billing,
    List<IyziBasketItem> items,
  ) async {
    final requester = Requester(config);
    final uri = Uri.parse('${config.baseUrl}/3dsecure/initialize');
    num price = 0;
    for (final item in items) {
      price += num.tryParse(item.price) ?? 0;
    }
    final body = jsonEncode({
      'locale': 'tr',
      'conversationId': conv,
      'currency': currency,
      'callbackUrl': config.callBackUrl,
      'price': price.toStringAsFixed(2),
      'paidPrice': price.toStringAsFixed(2),
      'installment': 1,
      'paymentCard': card.toMap,
      'buyer': buyer.toMap,
      // 'billingAddress': billing.toMap,
      'basketItems': [...items.map((e) => e.toMap)],
      // 'shippingAddress': billing.toMap,
    });
    final response = await requester.createRequest(uri, body);
    return IyziInit3D.fromJson(response.body);
  }

  Future<String> complete3D(
    String conv,
    String paymentId,
    String? conversationData,
  ) async {
    final requester = Requester(config);
    final uri = Uri.parse('${config.baseUrl}/3dsecure/auth');
    final body = jsonEncode({
      'locale': 'tr',
      'paymentId': paymentId,
      'conversationId': conv,
      'conversationData': conversationData,
    });
    final response = await requester.createRequest(uri, body);
    return response.body;
  }
}
