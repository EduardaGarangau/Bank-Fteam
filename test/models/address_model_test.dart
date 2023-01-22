import 'package:bank_challenge/models/address_model.dart';
import 'package:test/test.dart';

void main() {
  late Address address;
  group('Address Model', () {
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
    test('should return the street', () {
      expect(address.street, equals('Rua José Mario de Oliveira'));
    });

    test('should return the number', () {
      expect(address.number, equals('120'));
    });
    test('should return the district', () {
      expect(address.district, equals('Bacacheri'));
    });

    test('should return the city', () {
      expect(address.city, equals('Curitiba'));
    });

    test('should return the state', () {
      expect(address.state, equals('Paraná'));
    });

    test('should return the CEP', () {
      expect(address.cep, equals('82520550'));
    });

    test('should return null if not provide complement', () {
      expect(address.complement, equals(null));
    });

    test('should return the complement if provided', () {
      address.complement = 'Apartamento 120';
      expect(address.complement, equals('Apartamento 120'));
    });
  });
}
