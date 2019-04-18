import 'package:flutter/material.dart';
import './../../game/game.dart';

class WelcomeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _paddingHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: _getForm(context),
      ) 
    );
  }

  void _moveToGameScreen(BuildContext context) {
    if (_formKey.currentState.validate()) {
      print('Moving to next window');
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => Game())
      );
    }
  }

  Form _getForm(BuildContext context) {
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
            onPressed: () => _moveToGameScreen(context),
            child: Text('Login'),
          )
        ],
      )
    );
  }
}
