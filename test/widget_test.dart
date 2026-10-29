
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Music portfolio app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MusicPortfolioApp());

    expect(find.byType(MusicPortfolioApp), findsOneWidget);
  });
}
