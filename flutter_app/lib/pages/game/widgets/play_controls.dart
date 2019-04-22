import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayControls extends StatelessWidget {
  final Function onNewGame; 

  const PlayControls(this.onNewGame); 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text('New Game'),
          onPressed: onNewGame
        )
      ],
    );
  }
}