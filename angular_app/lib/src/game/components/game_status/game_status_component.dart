import 'package:angular/angular.dart';
import 'package:common/common.dart';

@Component(
  selector: 'game-status',
  styleUrls: [
    'game_status_component.css'
  ],
  exports: [
    Player
  ],
  templateUrl: 'game_status_component.html',
  directives: [
    NgIf
  ],
  pipes: []
)
class GameStatusComponent {
  @Input() GameState gameState;
}
