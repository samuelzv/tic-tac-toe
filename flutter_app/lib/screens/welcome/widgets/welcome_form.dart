import 'package:flutter/material.dart';
import 'package:common/common.dart';
import './../../game/game.dart';

class WelcomeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Function _onLogin;
  final _paddingHeight = 50.0;

  WelcomeForm(this._onLogin); 

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
      // print(this._gameState.username);
      _onLogin('fulano');

      /*
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => GamePage())
      );
      */
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
