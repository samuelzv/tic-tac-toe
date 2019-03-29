@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'package:angular_app/app_component.dart';
import './app_test.template.dart' as ng;

void main() {
  ng.initReflector();
  tearDown(disposeAnyRunningTest);

  test('Default welcome', () async {
    final testBed = new NgTestBed<AppComponent>();
    final textFixture = await testBed.create();

    expect(textFixture.text.trim(), 'Welcome to the Noughts and Crosses game');

    await textFixture.update((c) => c.welcomeText = 'Hello folks');
    expect(textFixture.text.trim(), 'Hello folks');
  });
}