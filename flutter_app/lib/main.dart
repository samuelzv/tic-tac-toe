import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';

import 'package:common/common.dart';
import './pages/home/home.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

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
        child: HomePage(),
      ) 
    );
  }

  @override
  void dispose() {
    _gameBloc.dispose();
    super.dispose();
  }
}
