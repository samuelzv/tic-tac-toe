import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:common/common.dart';

@Component(
  selector: 'play-controls',
  styleUrls: [
    'play_controls_component.css'
  ],
  templateUrl: 'play_controls_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  pipes: []
)
class PlayControlsComponent implements OnInit, OnDestroy {
  @Input() GameState gameState;
  final _newGame = new StreamController<void>();
  @Output() get newGame => _newGame.stream;

  PlayControlsComponent();

  @override
  void ngOnInit() async {
  }

  @override
  void ngOnDestroy() {
  }

  void onNewGame() {
    _newGame.add(null);
  }
}
