import 'package:angular/angular.dart';
import 'package:common/common.dart';

@Component(
  selector: 'tictac-game-status',
  styleUrls: [
    'game_status_component.css'
  ],
  exports: [
    Player,
    GamePhase
  ],
  templateUrl: 'game_status_component.html',
  directives: [
    NgIf
  ],
  pipes: []
)
class GameStatusComponent {
  @Input() DataState gameState;
}
