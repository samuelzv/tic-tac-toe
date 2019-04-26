import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Tic-Tac-Toe')),
      body: BlocBuilder(
          bloc: BlocProvider.of<GameBloc>(context),
          builder: (BuildContext context, DataState gameState) {
            return LoginForm(onLogin: (String username) => BlocProvider.of<GameBloc>(context).dispatch(LoginBlocEvent(username)));
          }
        ) 
    );
  }
}