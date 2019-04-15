import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:common/common.dart';

@Component(
  selector: 'game-controls',
  styleUrls: [
    'material_custom.css',
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
  @Input() GameState gameState;
  final _newGame = new StreamController<void>();
  @Output() get newGame => _newGame.stream;

  void onNewGame() {
    _newGame.add(null);
  }
}
