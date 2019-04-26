import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';
import '../login/login.dart';
import '../game/game.dart';

class HomePage extends StatelessWidget {

  Widget _homeWidget(BuildContext context, Function onStart) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final num padding = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tic-Tac-Toe',style: textTheme.headline),
              SizedBox(height: padding,),
              Text('Are you ready?',style: textTheme.subhead),
              SizedBox(height: padding,),
              RaisedButton(
                child: Text('Start'),
                onPressed: onStart ,
              ),
            ],
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder(
          bloc: BlocProvider.of<GameBloc>(context),
          builder: (BuildContext context, DataState state) {
            if (state is Welcome) {
                return LoginPage();
            }

            if (state is Login)  {
              print(state);
              return GamePage();
            }

            if (state is Movement) {
              return GamePage();
            }

            if (state is NewGame) {
              return GamePage();
            }

            if (state is DataState || state == null || state is Logout) {
              return _homeWidget(context, () {
                BlocProvider.of<GameBloc>(context).dispatch(WelcomeBlocEvent()); 
              });
            } 
          }
        )
    ); 
  }
}