import 'package:iyzi_dart/iyzi_dart.dart';
import 'package:iyzi_dart/models/iyzi_basket_item.dart';
import 'package:iyzi_dart/models/iyzi_billing.dart';
import 'package:iyzi_dart/models/iyzi_bin.dart';
import 'package:iyzi_dart/models/iyzi_buyer.dart';
import 'package:iyzi_dart/models/iyzi_card.dart';
import 'package:iyzi_dart/models/iyzi_init_3d.dart';
import 'gitsecret/keys.dart';

void main() async {
  IyziConfig config =
      IyziConfig(Keys.baseUrl, Keys.callBackUrl, Keys.apiKey, Keys.secretKey, 'RANDOMKEY');
  IyziDart iyziDart = IyziDart(config);

  IyziCard card = IyziCard('Tahsin Emre Telli', '000', '12', '2030', '5400010000000004');
  IyziBasketItem item =
      IyziBasketItem('turboTalkers', '360.50', 'Turkish Lesson', 'DIGITAL SERVICE', 'VIRTUAL');
  IyziBilling billing = IyziBilling(
    'Adatepe Mh. Doğuş Cd. No:207Z D:1 Buca/İzmir',
    'Tahsin Emre Telli',
    'İzmir',
    'İstanbul',
  );
  IyziBuyer buyer = IyziBuyer(
    'userIdOnFirebaseAuth',
    'Tahsin Emre',
    'Telli',
    '11111111111',
    'telli@tahsinemre.com',
    'Adatepe Mh. Doğuş Cd. No:207Z D:1 Buca/İzmir',
    'İzmir',
    'Türkiye',
    '193.140.25.34',
  );
  IyziBin bin = await iyziDart.binCheck('589004', 'testConv1');
  print(bin.toMap);
  print('*************');
  IyziInit3D init3d = await iyziDart.init3D('testConv2', 'USD', card, buyer, billing, [item]);
  print(init3d.toMap);
  print('%%%%%%%%%%%%%');
  print(init3d.convertHtml());
}
