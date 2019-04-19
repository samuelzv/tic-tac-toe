import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './widgets/welcome_form.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: BlocBuilder(
        bloc: _gameBloc,
        builder: (BuildContext context, GameState gameState) {
          return WelcomeForm((String username) {
              print ('on login');
              print('The user name is $username');
              print(_gameBloc.dispatch);
              print('----');
            }
          );
        }
      ),
    );
  }
}