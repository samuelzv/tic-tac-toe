import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart';

class Score extends StatelessWidget {
  const Score();  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<GameBloc>(context),
      builder: (BuildContext context, DataState state) {
        return Container(
          height: 120.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('You'),
                  Text('Computer'),
                  Text('Ties')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(state.score.human.toString()),
                  Text(state.score.computer.toString()),
                  Text(state.score.tied.toString())
                ],
              )
            ],
          )
        );
    });
  }
}
