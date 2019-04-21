import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';
import '../login/login.dart';
import '../game/game.dart';

class HomePage extends StatelessWidget {

  Widget _homeWidget(Function onStart) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome, are you ready?'),
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

            if (state is DataState || state == null) {
              return _homeWidget(() {
                BlocProvider.of<GameBloc>(context).dispatch(WelcomeBlocEvent()); 
              });
            } 
          }
        )
    ); 
  }
}