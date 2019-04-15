import 'package:angular/angular.dart';

import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/annotations/rtl_annotation.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/scorecard/scoreboard.dart';
import 'package:angular_components/scorecard/scorecard.dart';
import 'package:angular_components/utils/color/material.dart';

import 'package:common/common.dart';

@Component(
  selector: 'game-score',
  styleUrls: [
    'material_custom.css',
    'game_score_component.css'
  ],
  exports: [
    Player,
    GamePhase,
    green500
  ],
  templateUrl: 'game_score_component.html',
  directives: [
    formDirectives,
    materialNumberInputDirectives,
    NgIf,
    NgFor,
    ScoreboardComponent,
    ScorecardComponent
  ],
  providers: [
    rtlProvider
  ],
  pipes: []
)
class GameScoreComponent {
  @Input() GameState gameState;
}
