import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:common/common.dart';

@Component(
  selector: 'game-board',
  styleUrls: ['game_board_component.css'],
  templateUrl: 'game_board_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  pipes: [BlocPipe]
)
class GameBoardComponent implements OnInit, OnDestroy {
  GameBloc gameBloc;
  GameBoardComponent();

  @override
  void ngOnInit() async {
    gameBloc = GameBloc();
    gameBloc.dispatch(GameEvent.start);
  }

  @override
  void ngOnDestroy() {
    gameBloc.dispose();
  }


}
