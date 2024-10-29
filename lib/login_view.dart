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
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Сообщение'),
          content: const Text('Добро пожаловать'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      _formKey.currentState!.reset();
      user = User(email: _fieldEmailCtr.text, phone: _fieldPhoneCtr.text);
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
                controller: _fieldEmailCtr,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _fieldPhoneCtr,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: _validatePhone,
              ),
              TextButton(onPressed: _submitForm, child: const Text('Войти')),
              TextButton(
                child: const Text('Назад'),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ));
  }
}
