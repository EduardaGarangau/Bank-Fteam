class Address {
  final String street;
  final String number;
  final String district;
  final String city;
  final String state;
  final String cep;
  final String? complement;

  Address({
    required this.street,
    required this.number,
    required this.district,
    required this.city,
    required this.state,
    required this.cep,
    required this.complement,
  });
}
