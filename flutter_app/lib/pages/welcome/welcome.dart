import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './widgets/welcome_form.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: BlocListener(
        bloc: BlocProvider.of<GameBloc>(context),
        listener: (BuildContext context, GameState state) {
          print('The state is:');
          print(state);
        },
        child: BlocBuilder(
          bloc: BlocProvider.of<GameBloc>(context),
          builder: (BuildContext context, GameState gameState) {
            return WelcomeForm((String username) =>_gameBloc.dispatch(LoginBlocEvent(username)));
          }
        ),
      ) 
    );
  }
}