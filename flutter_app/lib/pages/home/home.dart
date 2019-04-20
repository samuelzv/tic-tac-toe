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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome, are you ready?'),
              RaisedButton(
                child: Text('Start'),
                onPressed: onStart ,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('THIS IS THE BUILD');
    return Container(
      child: BlocBuilder(
          bloc: BlocProvider.of<GameBloc>(context),
          builder: (BuildContext context, DataState state) {
            if (state is Welcome) {
                return LoginPage();
            }

            if (state is Login)  {
              return GamePage();
            }

            if (state is DataState || state == null) {
              return _homeWidget(() {
                BlocProvider.of<GameBloc>(context).dispatch(WelcomeBlocEvent()); 
              });
            } 
          }
        )
      /*child: BlocListener(
        bloc: _gameBloc, 
        listener: (BuildContext context, DataState state) {
          if (state is Welcome) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage())
            );
          } else {
            if (state is Login) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GamePage())
              );
            }
          }
          // print('hello');
        },
        child: BlocBuilder(
          bloc: _gameBloc,
          builder: (BuildContext context, DataState state) {
              return _homeWidget(() => _gameBloc.dispatch(WelcomeBlocEvent()));
          }
        ),
      ),*/ 
    ); 
  }
}