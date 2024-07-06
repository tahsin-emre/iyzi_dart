import 'package:iyzi_dart/iyzi_dart.dart';
import 'package:iyzi_dart/models/bin_dart.dart';
import 'gitsecret/keys.dart';

void main() async {
  IyziConfig config = IyziConfig(Keys.baseUrl, Keys.apiKey, Keys.secretKey, 'RANDOMKEY');
  IyziDart iyziDart = IyziDart(config);

  BinDart bin = await iyziDart.binCheck('589004', 'testConv1');
  print(bin.toMap);
}
