import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';

import 'package:common/common.dart';
import './pages/login/login.dart';
import './pages/game/game.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GameBloc _gameBloc = GameBloc();

  Widget getComponentByState(BuildContext context) {
   return Container(
      child: BlocBuilder(
          bloc:  _gameBloc, //BlocProvider.of<GameBloc>(context),
          builder: (BuildContext context, DataState state) {
            return (state is Login || state is Movement || state is NewGame) ? GamePage() : LoginPage();
          }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GameBloc>(
        bloc: _gameBloc,
        child: getComponentByState(context),
      ) 
    );
  }

  @override
  void dispose() {
    _gameBloc.dispose();
    super.dispose();
  }
}
