import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldFirstNameCtr = TextEditingController();
  final TextEditingController _fieldLastNameCtr = TextEditingController();
  final TextEditingController _fieldEmailCtr = TextEditingController();
  final TextEditingController _fieldPhoneCtr = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.reset();
      print(_fieldFirstNameCtr.text);
      print(_fieldLastNameCtr.text);
      print(_fieldEmailCtr.text);
      print(_fieldPhoneCtr.text);

      //print('Submit');
    }
  }

  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? _validatePhone(value) {
    if (_isNumeric(value) == false)
      return 'Заполните поле Phone';
    else
      return null;
  }

  String? _validateEmail(value) {
    if (EmailValidator.validate(value) == false)
      return 'Заполните поле Email';
    else
      return null;
  }
  
  String? _validateName(value) {
    if (value == '')
      return 'Заполните поле Name';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _fieldFirstNameCtr,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: _validateName,
              ),
              TextFormField(
                controller: _fieldLastNameCtr,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: _validateName,
              ),
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
              TextButton(onPressed: _submitForm, child: const Text('Отправить')),

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
