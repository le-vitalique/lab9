import 'package:email_validator/email_validator.dart';

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  User copyWith(
      {String? firstName, String? lastName, String? email, String? phone}) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  bool validateEmail() {
    if (email == null || EmailValidator.validate(email.toString()) == false) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePhone() {
    if (phone == null) {
      return false;
    }
    return double.tryParse(phone.toString()) != null;
  }

  bool validateFirstName() {
    if (firstName == null || firstName.toString().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validateLastName() {
    if (lastName == null || lastName.toString().isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
