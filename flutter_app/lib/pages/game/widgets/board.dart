import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';

class GameBoard  extends StatelessWidget {

  BoxDecoration _getBorder(CellPosition position) {
    BorderSide left, top, right, bottom; 
    BorderSide defaultBorder = BorderSide(width: 5.0);

    if (position.row == 0) {
      top = BorderSide.none;
    }

    if (position.row == 2) {
      bottom = BorderSide.none;
    }

    if (position.column == 0) {
      left = BorderSide.none;
    }

    if (position.column == 2) {
      right = BorderSide.none;
    }

    return BoxDecoration(
      border: Border(
        top: top ?? defaultBorder, 
        left: left ?? defaultBorder, 
        right: right ?? defaultBorder,
        bottom: bottom ?? defaultBorder) 
      );
  }

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
          padding: EdgeInsets.all(15.0),
          decoration: _getBorder(cell.position),
          child: FloatingActionButton(
            elevation: 0.0,
            child: icon,
            foregroundColor: foregroundColor, 
            backgroundColor: backgroundColor, 
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
        return _board(gameState, context);
      }
    );
  }
}