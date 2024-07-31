class Address {
  final String line1;
  final String city;
  final String country;
  final String zipcode;

  Address(
      {required this.line1,
      required this.city,
      required this.country,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        line1: json['line1'],
        city: json['city'],
        country: json['country'],
        zipcode: json['zipcode']);
  }

  Map<String, dynamic> toJson() {
    return {
      'line1': line1,
      'city': city,
      'country': country,
      'zipcode': zipcode,
    };
  }
}
