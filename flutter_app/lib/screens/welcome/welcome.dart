import 'package:flutter/material.dart';

import './widgets/welcome_form.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: WelcomeForm(),
    );
  }
}