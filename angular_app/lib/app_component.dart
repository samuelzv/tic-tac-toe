import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/services/game_bloc_service.dart';
import 'src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
    <h1>{{appName}}</h1>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  providers: [GameBlocService],
  exports: [RoutePaths, Routes]
)
class AppComponent {
  String appName = 'Noughts and Crosses game';
}
