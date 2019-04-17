import 'package:flutter/material.dart';

class WelcomeForm extends StatefulWidget {
  @override
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Welcome'),
          Text('What is your name?'),
          TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return 'Your name is required';
              }
            }
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('Moving to next window');
                }
              },
              child: Text('Login'),
            )
          )
        ],
      )
    );
  }
}
