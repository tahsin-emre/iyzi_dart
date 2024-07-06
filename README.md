
## Getting started

## Usage

```dart

//Create iyziConfig with your urls and keys
IyziConfig iyziConfig = IyziConfig(baseUrl,callBackUrl,apiKey,secretKey,randomKey);
IyziDart iyziDart = IyziDart(iyziConfig);

//Bin Response
IyziBin binDart = await iyziDart.binCheck('YOUR-BIN','CONVERSATION-ID');
print(binDart.toMap);

IyziCard card = IyziCard('Tahsin Emre Telli', '000', '12', '2030', '5400010000000004');
IyziBasketItem item = IyziBasketItem('turboTalkers', '360.50', 'Turkish Lesson', 'DIGITAL SERVICE', 'VIRTUAL');
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

//3D Payment Init
await iyziDart.init3D('testConv2', 'USD', card, buyer, billing, [item]);

```

## Additional information
