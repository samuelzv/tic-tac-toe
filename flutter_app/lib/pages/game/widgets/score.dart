import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart';

class Score extends StatelessWidget {
  const Score();  

  Widget _getScoreItem(String label, int value) {
    return Column(
      children: [
        Text(label),
        Text(value.toString()),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<GameBloc>(context),
      builder: (BuildContext context, DataState state) {
        return Container(
          height: 120.0,
          child: Column(
            children: [
              Text('Score'),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getScoreItem('You', state.score.human),
                  _getScoreItem('Computer', state.score.computer),
                  _getScoreItem('Ties', state.score.tied),
                ],
              ),
            ],
          )
        );
    });
  }
}
