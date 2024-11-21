final class IyziCard {
  const IyziCard({
    required this.cardHolderName,
    required this.cvc,
    required this.expireMonth,
    required this.expireYear,
    required this.cardNumber,
  });

  final String cardHolderName;
  final String cvc;
  final String expireMonth;
  final String expireYear;
  final String cardNumber;
}
