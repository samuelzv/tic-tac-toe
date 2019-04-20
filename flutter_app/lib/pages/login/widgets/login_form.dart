import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function _onLogin;

  LoginForm(this._onLogin); 

  @override
  _LoginFormState createState() => _LoginFormState() ;
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _userTextController = TextEditingController();
  final _paddingHeight = 50.0;

  @override
  void dispose() { 
    _userTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: _getForm(context),
      ) 
    );
  }

  void _moveToGameScreen(String username) {
    if (_formKey.currentState.validate()) {
      print('Moving to next window');
      // print(this._gameState.username);
      widget._onLogin(username);
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
          TextFormField(
            controller: _userTextController,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Your name is required';
              }
            }
          ),
          SizedBox(height: _paddingHeight),
          RaisedButton(
            onPressed: () => _moveToGameScreen(_userTextController.text),
            child: Text('Login'),
          )
        ],
      )
    );
  }
}
