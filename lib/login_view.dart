import 'package:flutter/material.dart';
import 'package:lab9/user.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldEmailCtr = TextEditingController();
  final TextEditingController _fieldPhoneCtr = TextEditingController();
  User user = User();

  User? _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login_success');
      _formKey.currentState!.reset();
      user = User(email: _fieldEmailCtr.text, phone: _fieldPhoneCtr.text);
      return user;
    } else {
      return null;
    }
  }

  String? _validatePhone(value) {
    user.phone = value;
    if (user.phoneIsEmpty()) {
      return 'Заполните поле Phone';
    } else if (!user.phoneIsValid()) {
      return 'Введите корректное значение';
    } else {
      return null;
    }
  }

  String? _validateEmail(value) {
    user.email = value;
    if (user.emailIsEmpty()) {
      return 'Заполните поле Email';
    } else if (!user.emailIsValid()) {
      return 'Введите корректное значение';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fieldPhoneCtr.dispose();
    _fieldEmailCtr.dispose();
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
              child: const Text('Войти'),
            ),
            TextButton(
              child: const Text('Назад'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
