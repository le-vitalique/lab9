import 'package:flutter/material.dart';
import 'package:lab9/user.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldFirstNameCtr = TextEditingController();
  final TextEditingController _fieldLastNameCtr = TextEditingController();
  final TextEditingController _fieldEmailCtr = TextEditingController();
  final TextEditingController _fieldPhoneCtr = TextEditingController();
  User user = User();

  User? _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/register_success');
      _formKey.currentState!.reset();
      user = User(
          email: _fieldEmailCtr.text,
          phone: _fieldPhoneCtr.text,
          firstName: _fieldFirstNameCtr.text,
          lastName: _fieldLastNameCtr.text);
      return user;
    } else {
      return null;
    }
  }

  String? _validatePhone(value) {
    user.phone = value;
    if (user.validatePhone() == false) {
      return 'Заполните поле Phone';
    } else {
      return null;
    }
  }

  String? _validateEmail(value) {
    user.email = value;
    if (user.validateEmail() == false) {
      return 'Заполните поле Email';
    } else {
      return null;
    }
  }

  String? _validateFirstName(value) {
    user.firstName = value;
    if (user.validateFirstName() == false) {
      return 'Заполните поле First Name';
    } else {
      return null;
    }
  }

  String? _validateLastName(value) {
    user.lastName = value;
    if (user.validateLastName() == false) {
      return 'Заполните поле Last Name';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fieldEmailCtr.dispose();
    _fieldPhoneCtr.dispose();
    _fieldFirstNameCtr.dispose();
    _fieldLastNameCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              key: const Key('firstName'),
              controller: _fieldFirstNameCtr,
              decoration: const InputDecoration(labelText: 'First Name'),
              validator: _validateFirstName,
            ),
            TextFormField(
              key: const Key('lastName'),
              controller: _fieldLastNameCtr,
              decoration: const InputDecoration(labelText: 'Last Name'),
              validator: _validateLastName,
            ),
            TextFormField(
              key: const Key('email'),
              controller: _fieldEmailCtr,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: _validateEmail,
            ),
            TextFormField(
              key: const Key('phone'),
              controller: _fieldPhoneCtr,
              decoration: const InputDecoration(labelText: 'Phone'),
              validator: _validatePhone,
            ),
            TextButton(
              key: const Key('submit'),
              onPressed: _submitForm,
              child: const Text('Зарегистрироваться'),
            ),
            TextButton(
              child: const Text('Назад'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
