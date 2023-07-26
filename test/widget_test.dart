import 'package:animated_splash/main.dart';
import 'package:animated_splash/pages/animated-splash/animated_logo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AnimatedSplashApp());

    expect(find.text('LOGO TEXT'), findsOneWidget);
    expect(find.byType(AnimatedLogo), findsOneWidget);
  });
}
