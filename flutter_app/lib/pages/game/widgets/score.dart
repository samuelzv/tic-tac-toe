import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart';

class Score extends StatelessWidget {
  const Score();  

  Widget _getScoreItem(BuildContext context, String label, int value) {
    TextTheme theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(label, style: theme.title,),
        Text(value.toString(), style: theme.title),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return BlocBuilder(
      bloc: BlocProvider.of<GameBloc>(context),
      builder: (BuildContext context, DataState state) {
        return Container(
          height: 120.0,
          child: Column(
            children: [
              Text('Score', style: theme.headline,),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getScoreItem(context, 'You', state.score.human),
                  _getScoreItem(context, 'Computer', state.score.computer),
                  _getScoreItem(context, 'Ties', state.score.tied),
                ],
              ),
            ],
          )
        );
    });
  }
}
