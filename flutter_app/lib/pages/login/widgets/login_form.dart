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
    return  SingleChildScrollView(
      // padding: EdgeInsets.all(8.0),
      child: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _paddingHeight),
                Text(
                  'What is your name?',
                  style: Theme.of(context).textTheme.title
                ),
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
          )
        ) 
      ) 
    );
  }
}
