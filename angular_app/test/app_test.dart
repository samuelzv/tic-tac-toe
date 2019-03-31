@TestOn('browser')

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'package:angular_app/app_component.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'app_test.template.dart' as self;
import 'utils.dart';

// class MockRouter extends Mock implements Router {}

@GenerateInjector([
  routerProviders,
  ClassProvider(Router, useClass: MockRouter)
])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory
  );

  tearDown(disposeAnyRunningTest);

  test('Should show app name', () async {
    final fixture = await testBed.create();

    expect(fixture.text.trim(), 'Noughts and Crosses game');
  });

  test('Should change app name', () async {
    final String appName = 'Super App';
    final fixture = await testBed.create() ;

    await fixture.update((c) => c.appName = appName);
    expect(fixture.text.trim(), appName);
  });

}