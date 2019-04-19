import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';
import './screens/welcome/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GameBloc _gameBloc = GameBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GameBloc>(
        bloc: _gameBloc,
        child: WelcomeScreen(),
      ) 
    );
  }

  @override
  void dispose() {
    _gameBloc.dispose();
    super.dispose();
  }
}

/*
class MyApp extends StatelessWidget {
  final GameBloc _gameBloc = GameBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GameBloc>(
        bloc: _gameBloc,
        child: WelcomeScreen(),
      ) 
    );
  }
  @override
  void dispose() {
    _gameBloc.dispose();
    super.dispose();
  }
}
*/