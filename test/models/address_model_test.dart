import 'package:bank_challenge/models/address_model.dart';
import 'package:test/test.dart';

void main() {
  late Address address;
  group('AddressModel:', () {
    setUp(() {
      address = Address(
        street: 'Rua José Mario de Oliveira',
        number: '120',
        district: 'Bacacheri',
        city: 'Curitiba',
        state: 'Paraná',
        cep: '82520550',
      );
    });
    test('should return the street that User provided', () {
      expect(address.street, equals('Rua José Mario de Oliveira'));
    });

    test('should return the number that User provided', () {
      expect(address.number, equals('120'));
    });
    test('should return the district that User provided', () {
      expect(address.district, equals('Bacacheri'));
    });

    test('should return the city that User provided', () {
      expect(address.city, equals('Curitiba'));
    });

    test('should return the state that User provided', () {
      expect(address.state, equals('Paraná'));
    });

    test('should return the CEP that User provided', () {
      expect(address.cep, equals('82520550'));
    });

    test('should return null if User not provided complement', () {
      expect(address.complement, equals(null));
    });

    test('should return the complement if User provided', () {
      address.complement = 'Apartamento 120';
      expect(address.complement, equals('Apartamento 120'));
    });
  });
}
