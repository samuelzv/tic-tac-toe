import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';

class Board  extends StatelessWidget {

  GridTile _getGridTile(Cell cell, BuildContext context) {
    Icon icon;
    if (cell.value != null) {
      icon =  (cell.value == Player.computer) ? Icon(Icons.android) : Icon(Icons.pets);
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
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey,
            // backgroundColor: new Color(0xFFE57373),
            onPressed: (){
              BlocProvider.of<GameBloc>(context).dispatch(GameMovementBlocEvent(cell.position));
            }
          ),
       )
    );
  }

  List<GridTile> _getGridTiles(List<List<Cell>> cells, BuildContext context) {
    return _getFlattenCells(cells, context)
          .map((Cell cell) => _getGridTile(cell, context)).toList();
  }

  Widget _board(List<List<Cell>> cells, BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        padding: EdgeInsets.all(40.0),
        children: _getGridTiles(cells, context)
    );
  }

  List<Cell> _getFlattenCells(List<List<Cell>> cells, BuildContext context) {
    List<Cell> flatten = [];

    for (int row = 0;  row < cells.length; row++) {
      for (int col = 0; col < cells[row].length; col++) {
        flatten.add(cells[row][col]);
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
                    child: _board(gameState.cells, context) 
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