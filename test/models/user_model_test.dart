import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  late User user;

  group('User Model with Valid Password', () {
    setUp(() {
      user = User(
        name: 'Eduarda',
        email: 'eduardagarangau98@gmail.com',
        phone: '41996717016',
        password: '12345678',
        cpf: '08591413903',
        address: Address(
          street: 'Rua José Mario de Oliveira',
          cep: '82520550',
          city: 'Curitiba',
          district: 'Bacacheri',
          number: '216',
          state: 'Paraná',
          complement: 'Sobrado 3',
        ),
      );
    });

    test('should return null if not provide monthlyIncome', () {
      expect(user.monthlyIncome, equals(null));
    });

    test('should return montlyIncome if provided', () {
      user.monthlyIncome = 3000.0;
      expect(user.monthlyIncome, equals(3000.0));
    });
  });

  group('User Model with Invalid Password', () {
    test('should throw Exception if provided password with small letters', () {
      expect(() {
        User(
          name: 'Eduarda',
          email: 'eduardagarangau98@gmail.com',
          phone: '41996717016',
          password: 'asdfghjk',
          cpf: '08591413903',
          address: Address(
            street: 'Rua José Mario de Oliveira',
            cep: '82520550',
            city: 'Curitiba',
            district: 'Bacacheri',
            number: '216',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test('should throw Exception if provided password with capital letters',
        () {
      expect(() {
        User(
          name: 'Eduarda',
          email: 'eduardagarangau98@gmail.com',
          phone: '41996717016',
          password: 'QWERTYUI',
          cpf: '08591413903',
          address: Address(
            street: 'Rua José Mario de Oliveira',
            cep: '82520550',
            city: 'Curitiba',
            district: 'Bacacheri',
            number: '216',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test('should throw Exception if provided password with numbers and letters',
        () {
      expect(() {
        User(
          name: 'Eduarda',
          email: 'eduardagarangau98@gmail.com',
          phone: '41996717016',
          password: '12as34df',
          cpf: '08591413903',
          address: Address(
            street: 'Rua José Mario de Oliveira',
            cep: '82520550',
            city: 'Curitiba',
            district: 'Bacacheri',
            number: '216',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test('should throw Exception if provided password with less than 8 digits',
        () {
      expect(() {
        User(
          name: 'Eduarda',
          email: 'eduardagarangau98@gmail.com',
          phone: '41996717016',
          password: '1234567',
          cpf: '08591413903',
          address: Address(
            street: 'Rua José Mario de Oliveira',
            cep: '82520550',
            city: 'Curitiba',
            district: 'Bacacheri',
            number: '216',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });
  });
}
