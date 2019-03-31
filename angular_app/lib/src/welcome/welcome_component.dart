import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

// import 'package:common/common.dart';
import '../services/game_bloc_service.dart';
import '../route_paths.dart';

@Component(
  selector: 'welcome',
  templateUrl: 'welcome_component.html' ,
  styleUrls: [
    'welcome_component.css'
  ],
  directives: [
    materialInputDirectives,
    formDirectives,
    MaterialFabComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    NgClass,
  ],
  pipes: [BlocPipe]
)
class WelcomeComponent implements OnInit, OnDestroy {
  final Router _router;
  final GameBlocService _gameBlocService;
  final String welcomeMessage = 'Welcome!';
  String userName;
  ControlGroup welcomeForm;

  WelcomeComponent(this._router, this._gameBlocService);

  @override
  void ngOnInit() async {
    welcomeForm = FormBuilder.controlGroup({
      'username': ['', Validators.required]
    });
  }

  @override
  void ngOnDestroy() {
  }

  void onSubmit() {
    final String username = welcomeForm.value['username'];

    this._gameBlocService.login(username);
    Future.delayed(Duration(seconds: 1), () {
      this._router.navigate(RoutePaths.game.toUrl());
    });
  }
}
