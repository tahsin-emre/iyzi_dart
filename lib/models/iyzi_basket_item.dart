import 'package:iyzi_dart/enums/item_types.dart';

final class IyziBasketItem {
  /// Category 2 is optional
  const IyziBasketItem({
    required this.id,
    required this.price,
    required this.name,
    required this.category1,
    required this.itemType,
    this.category2,
  });

  final String id;
  final String price;
  final String name;
  final String category1;
  final String? category2;
  final ItemTypes itemType;
}
