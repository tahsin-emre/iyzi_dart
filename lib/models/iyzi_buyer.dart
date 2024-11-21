final class IyziBuyer {
  const IyziBuyer({
    required this.id,
    required this.name,
    required this.surname,
    required this.identityNumber,
    required this.email,
    required this.registrationAddress,
    required this.city,
    required this.country,
    required this.ip,
    this.gsmNumber,
    this.registrationDate,
    this.lastLoginDate,
    this.zipCode,
  });

  final String id;
  final String name;
  final String surname;
  final String identityNumber;
  final String email;
  final String registrationAddress;
  final String city;
  final String country;
  final String ip;
  final String? gsmNumber;
  final String? registrationDate;
  final String? lastLoginDate;
  final String? zipCode;
}
