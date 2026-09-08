import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_button_app/main.dart';

void main() {
  testWidgets('one button changes the color and announcement on every tap',
      (tester) async {
    await tester.pumpWidget(const OneButtonApp());
    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    expect(find.text('Mint condition · #C8F0DF'), findsOneWidget);

    Color? background() =>
        (tester.widget<AnimatedContainer>(find.byType(AnimatedContainer)).decoration
                as BoxDecoration)
            .color;

    for (var tap = 0; tap < 20; tap++) {
      final previous = background();
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(background(), isNot(previous));
      final hex = background()!.toARGB32().toRadixString(16).substring(2).toUpperCase();
      expect(find.textContaining('#$hex'), findsOneWidget);
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('button stays usable on a narrow screen', (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const OneButtonApp());
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Mint condition · #C8F0DF'), findsNothing);
  });
}
