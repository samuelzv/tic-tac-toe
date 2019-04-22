import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart';

import './widgets/board.dart';
import './widgets/play_controls.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Widget _getGame() {
    GameBloc _gameBloc = BlocProvider.of<GameBloc>(context);
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text('This is a Header2'),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5 ,
                    child: GameBoard(),
                  )
                )
              ),  
              PlayControls(
                () => _gameBloc.dispatch(NewGameBlocEvent()),
                () => _gameBloc.dispatch(LogoutBlocEvent()) ),
              Text('This is the score ${MediaQuery.of(context).size.height}'),
            ]
          )
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe Game'),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GameBloc>(context),
        builder: (BuildContext context, DataState state) {
          return _getGame();
        },
      ) 
    );
  }
}