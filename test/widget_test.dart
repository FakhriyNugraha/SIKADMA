import 'package:flutter_test/flutter_test.dart';

import 'package:unib_studenthub/main.dart';

void main() {
  testWidgets('App boots and shows splash branding', (tester) async {
    await tester.pumpWidget(const UnibStudentHubApp());
    await tester.pump();

    expect(find.text('Data Mahasiswa'), findsOneWidget);
  });
}
