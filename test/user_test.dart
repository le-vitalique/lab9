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
      'should return true if email is not empty and valid',
      () {
        bool isEmpty = user.emailIsEmpty();
        bool isValid = user.emailIsValid();
        expect(!isEmpty && isValid, true);
      },
    );
    test(
      'should return true if phone is not empty and valid',
      () {
        bool isEmpty = user.phoneIsEmpty();
        bool isValid = user.phoneIsValid();
        expect(!isEmpty && isValid, true);
      },
    );
    test('should return true when called validateFirstName with non empty first name',
        () {
      bool isValid = user.validateFirstName();
      expect(isValid, true);
    });
    test('should return true when called validateLastName with non empty last name',
        () {
      bool isValid = user.validateLastName();
      expect(isValid, true);
    });
  });
}
