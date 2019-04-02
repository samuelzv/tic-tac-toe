import 'package:angular_router/angular_router.dart';

import './welcome/welcome_component.template.dart' as welcome_component_template;
import './game/game_component.template.dart' as game_component_template;
import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  static final welcome = RouteDefinition(
    routePath: RoutePaths.welcome,
    component: welcome_component_template.WelcomeComponentNgFactory
  );
  static final game = RouteDefinition(
    routePath: RoutePaths.game,
    component: game_component_template.GameComponentNgFactory
  );

  static final all = <RouteDefinition> [
    welcome,
    game,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.welcome.toUrl()
    )
  ];

}