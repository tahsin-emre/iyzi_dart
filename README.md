
## Getting started

## Usage

```dart
IyziConfig iyziConfig = IyziConfig(baseUrl,apiKey,secretKey,randomKey);
IyziDart iyziDart = IyziDart(iyziConfig);
BinDart binDart = await iyziDart.binCheck('YOUR-BIN','CONVERSATION-ID');
print(binDart.toMap);

```

## Additional information
