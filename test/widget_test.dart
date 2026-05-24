import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unib_studenthub/app/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton renders label and reacts to tap', (tester) async {
    var tapped = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            label: 'Tekan Saya',
            onPressed: () => tapped++,
          ),
        ),
      ),
    );
    expect(find.text('Tekan Saya'), findsOneWidget);
    await tester.tap(find.text('Tekan Saya'));
    expect(tapped, 1);
  });
}
