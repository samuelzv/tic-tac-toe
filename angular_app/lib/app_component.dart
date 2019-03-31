import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/board/board_component.dart';
import 'src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  exports: [RoutePaths, Routes]
)
class AppComponent {
  String welcomeText = 'Welcome to the Noughts and Crosses game';
}
