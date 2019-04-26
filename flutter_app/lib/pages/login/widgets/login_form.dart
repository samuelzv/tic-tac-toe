import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function onLogin;

  LoginForm({this.onLogin}); 

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
    return _getForm(context);
  }

  void _moveToGameScreen(String username) {
    if (_formKey.currentState.validate()) {
      widget.onLogin(username);
    }
  }

  Widget _getForm(BuildContext context) {
   TextTheme textTheme = Theme.of(context).textTheme;

    return  SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to Tic-Tac-Toe',
                  style: textTheme.headline
                ),
                SizedBox(height: _paddingHeight),
                Text(
                  'What is your name?',
                  style: textTheme.title
                ),
                SizedBox(
                  width: 200.0,
                  child: TextFormField(
                    controller: _userTextController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Your name is required';
                      }
                    }
                  )
                ),
                SizedBox(height: _paddingHeight),
                RaisedButton(
                  onPressed: () => _moveToGameScreen(_userTextController.text),
                  child: Text('Login'),
                )
              ],
            )
          )
        ) 
      ) 
    );
  }
}
