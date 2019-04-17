import 'package:flutter/material.dart';

class WelcomeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _paddingHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: _getForm(),
      ) 
    );
  }

  void _moveToGameScreen() {
    if (_formKey.currentState.validate()) {
      print('Moving to next window');
    }
  }

  Form _getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Welcome!'),
          SizedBox(height: _paddingHeight),
          Text('What is your name?'),
          TextFormField(validator: (String value) {
            if (value.isEmpty) {
              return 'Your name is required';
            }
          }),
          SizedBox(height: _paddingHeight),
          RaisedButton(
            onPressed: _moveToGameScreen,
            child: Text('Login'),
          )
        ],
      )
    );
  }
}
