import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';


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
  ]
)
class GameBoardComponent implements OnInit {
  GameBoardComponent();

  @override
  Future<Null> ngOnInit() async {
  }
}
