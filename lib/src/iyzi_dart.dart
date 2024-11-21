import 'dart:convert';

import 'package:iyzi_dart/extensions/address_ext.dart';
import 'package:iyzi_dart/extensions/basket_item_ext.dart';
import 'package:iyzi_dart/extensions/buyer_ext.dart';
import 'package:iyzi_dart/extensions/card_ext.dart';
import 'package:iyzi_dart/models/iyzi_address.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_bin_response.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';
import 'package:iyzi_dart/models/iyzi_config.dart';
import 'package:iyzi_dart/models/iyzi_init_response.dart';
import 'package:iyzi_dart/src/requester.dart';

final class IyziDart {
  const IyziDart(this.config);
  final IyziConfig config;

  Future<IyziBinResponse> binCheck({
    required String binNumber,
    required String conversationId,
    String? locale = 'tr',
  }) async {
    final requester = Requester(config);
    final uri = Uri.parse('${config.baseUrl}/bin/check');
    final body = jsonEncode({
      'locale': locale,
      'binNumber': binNumber,
      'conversationId': conversationId,
      'price': 100,
    });
    final response = await requester.createRequest(uri, body);
    return IyziBinResponse.fromJson(response.body);
  }

  /// Currency default is 'TRY'
  /// Locale default is 'tr'
  Future<IyziInitResponse> initializePayment({
    required String conversationId,
    required IyziCard card,
    required IyziBuyer buyer,
    required IyziAddress billingAddress,
    required IyziAddress shippingAddress,
    required List<IyziBasketItem> basketItems,
    String currency = 'TRY',
    String locale = 'tr',
  }) async {
    final requester = Requester(config);
    final uri = Uri.parse('${config.baseUrl}/3dsecure/initialize');
    num price = 0;
    for (final item in basketItems) {
      price += num.tryParse(item.price) ?? 0;
    }
    final body = jsonEncode({
      'locale': locale,
      'conversationId': conversationId,
      'currency': currency,
      'callbackUrl': config.callBackUrl,
      'price': price.toStringAsFixed(2),
      'paidPrice': price.toStringAsFixed(2),
      'installment': 1,
      'paymentCard': card.toMap,
      'buyer': buyer.toMap,
      'billingAddress': billingAddress.toMap,
      'shippingAddress': shippingAddress.toMap,
      'basketItems': [...basketItems.map((basketItem) => basketItem.toMap)],
    });
    final response = await requester.createRequest(uri, body);
    return IyziInitResponse.fromJson(response.body);
  }

  /// Locale default is 'tr'
  Future<String> completePayment({
    required String conversationId,
    required String paymentId,
    required String? conversationData,
    String locale = 'tr',
  }) async {
    final requester = Requester(config);
    final uri = Uri.parse('${config.baseUrl}/3dsecure/auth');
    final body = jsonEncode({
      'locale': locale,
      'paymentId': paymentId,
      'conversationId': conversationId,
      'conversationData': conversationData,
    });
    final response = await requester.createRequest(uri, body);
    return response.body;
  }
}
