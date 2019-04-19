import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';
import 'package:common/common.dart';

import '../../../route_paths.dart';

@Component(
  selector: 'tictac-game-controls',
  styleUrls: [
    'game_controls_component.css'
  ],
  templateUrl: 'game_controls_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  pipes: []
)
class GameControlsComponent {
  @Input() DataState gameState;
  final _newGame = new StreamController<void>();
  @Output() get newGame => _newGame.stream;
  final Router _router;

  GameControlsComponent(this._router);

  void onNewGame() {
    _newGame.add(null);
  }

  void onLogout() {
    this._router.navigate(RoutePaths.welcome.toUrl());
  }
}
