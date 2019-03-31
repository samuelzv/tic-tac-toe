@TestOn('browser')

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:angular_app/app_component.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'app_test.template.dart' as self;

class MockRouter extends Mock implements Router {}

@GenerateInjector([
  routerProviders,
  ClassProvider(Router, useClass: MockRouter)
])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  ng.initReflector();
  tearDown(disposeAnyRunningTest);

  test('Show app name', () async {
    final testBed = NgTestBed.forComponent<AppComponent>(
      ng.AppComponentNgFactory,
      rootInjector: rootInjector);

    final textFixture = await testBed.create();

    expect(textFixture.text.trim(), 'Noughts and Crosses game');

    // await textFixture.update((c) => c.appName = 'Super App');
    // expect(textFixture.text.trim(), 'Super App');
  });
}