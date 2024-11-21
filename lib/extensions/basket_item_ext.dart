import 'package:iyzi_dart/models/iyzi_basket_item.dart';

extension BasketItemExt on IyziBasketItem {
  Map<String, String> get toMap => {
        'id': id,
        'price': price,
        'name': name,
        'category1': category1,
        'itemType': itemType.name,
      };
}
