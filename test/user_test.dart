import 'package:flutter_test/flutter_test.dart';
import 'package:lab9/user.dart';

void main() {
  final User user = User(
    email: 'user@gmail.com',
    phone: '79296661234',
    firstName: 'Иван',
    lastName: 'Иванов',
  );
  group('testing user email and phone', () {
    test(
      'should return true when called validateEmail with valid email',
      () {
        bool isEmpty = user.emailIsEmpty();
        bool isValid = user.emailIsValid();
        expect(!isEmpty && isValid, true);
      },
    );
    test(
      'should return true when called validatePhone with valid phone',
      () {
        bool isEmpty = user.phoneIsEmpty();
        bool isValid = user.phoneIsValid();
        expect(!isEmpty && isValid, true);
      },
    );
    test('should true when called validateFirstName with non empty first name',
        () {
      bool isValid = user.validateFirstName();
      expect(isValid, true);
    });
    test('should true when called validateLastName with non empty last name',
        () {
      bool isValid = user.validateLastName();
      expect(isValid, true);
    });
  });
}
