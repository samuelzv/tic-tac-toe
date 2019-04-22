import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';

class Board  extends StatelessWidget {

  GridTile _getGridTile(DataState state, Cell cell, BuildContext context) {
    Icon icon;
    Color backgroundColor = Colors.white;
    Color foregroundColor = Colors.black;

    if (cell.value != null) {
      icon =  (cell.value == Player.computer) ? Icon(Icons.android) : Icon(Icons.pets);
    }

    if (cell.belongsToWinningCombination) {
      foregroundColor = Colors.white;
      backgroundColor =  (state.turn == Player.human) ?  Colors.blue :  Colors.red;
    }

     return GridTile(
        child: Container(
          padding: EdgeInsets.all(25.0),
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.blueAccent)
          ),
          child: FloatingActionButton(
            elevation: 0.0,
            child: icon,
            foregroundColor: foregroundColor, 
            backgroundColor: backgroundColor, 
            // backgroundColor: new Color(0xFFE57373),
            onPressed: (){
              GameBloc gameBloc = BlocProvider.of<GameBloc>(context);

              gameBloc.dispatch(GameMovementBlocEvent(cell.position));
              // Trigger computer movement
              Future.delayed(Duration(seconds: 1), () => gameBloc.dispatch(GameMovementBlocEvent(null)));
            }
          ),
       )
    );
  }

  List<GridTile> _getGridTiles(DataState state, BuildContext context) {
    return _getFlattenCells(state, context)
          .map((Cell cell) => _getGridTile(state, cell, context)).toList();
  }

  Widget _board(DataState state, BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        padding: EdgeInsets.all(40.0),
        children: _getGridTiles(state, context)
    );
  }

  List<Cell> _getFlattenCells(DataState state, BuildContext context) {
    List<Cell> flatten = [];

    for (int row = 0;  row < state.cells.length; row++) {
      for (int col = 0; col < state.cells[row].length; col++) {
        flatten.add(state.cells[row][col]);
      }
    }

    return flatten;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<GameBloc>(context),
      builder: (BuildContext context, DataState gameState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text('This is a Header2'),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .7 ,
                    child: _board(gameState, context) 
                  )
                )
              ),  
              Text('These are the play buttons'),
              Text('This is the score ${MediaQuery.of(context).size.height}'),
            ]
          )
        );
      }
    );
  }
}