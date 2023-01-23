import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  late User user;

  group('UserModel with Valid Password:', () {
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
          number: '1007',
          state: 'Paraná',
          complement: 'Sobrado 3',
        ),
      );
    });

    test('should return the name that User provided', () {
      expect(user.name, equals('Eduarda'));
    });

    test('should return the email that User provided', () {
      expect(user.email, equals('eduardagarangau98@gmail.com'));
    });

    test('should return the phone that User provided', () {
      expect(user.phone, equals('41996717016'));
    });

    test('should return the CPF that User provided', () {
      expect(user.cpf, equals('08591413903'));
    });

    test('address should not be null', () {
      expect(user.address, isNotNull);
    });

    test('should return null if User not provide monthlyIncome', () {
      expect(user.monthlyIncome, equals(null));
    });

    test('should return montlyIncome if User provided', () {
      user.monthlyIncome = 3000.0;
      expect(user.monthlyIncome, equals(3000.0));
    });

    test(
        'should not throw an Exception if User provided password with 8 numbers',
        () {
      expect(user, isNot(throwsA(isA<Exception>())));
    });
  });

  group('UserModel with Invalid Password:', () {
    test(
        'should throw an Exception if User provided password with just small letters',
        () {
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
            number: '1007',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception if User provided password with just capital letters',
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
            number: '1007',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception if User provided password with numbers and letters',
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
            number: '1007',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception if User provided password with less than 8 numbers',
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
            number: '1007',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception if User provided password with more than 8 numbers',
        () {
      expect(() {
        User(
          name: 'Eduarda',
          email: 'eduardagarangau98@gmail.com',
          phone: '41996717016',
          password: '123456789',
          cpf: '08591413903',
          address: Address(
            street: 'Rua José Mario de Oliveira',
            cep: '82520550',
            city: 'Curitiba',
            district: 'Bacacheri',
            number: '1007',
            state: 'Paraná',
            complement: 'Sobrado 3',
          ),
        );
      }, throwsA(isA<Exception>()));
    });
  });
}
