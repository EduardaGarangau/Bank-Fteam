class Address {
  final String street;
  final String number;
  String? complement;
  final String district;
  final String city;
  final String state;
  final String cep;

  Address({
    required this.street,
    required this.number,
    required this.district,
    required this.city,
    required this.state,
    required this.cep,
    this.complement,
  });
}
