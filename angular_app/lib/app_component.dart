import 'package:angular/angular.dart';

import 'src/board/board_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    BoardComponent
  ],
)
class AppComponent {
  String welcomeText = 'Welcome to the Noughts and Crosses game';
}
