import 'package:animated_splash/main.dart';
import 'package:animated_splash/pages/animated-splash/up_down_animation_container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AnimatedSplashApp());

    expect(find.text('LOGO TEXT'), findsOneWidget);
    expect(find.byType(UpDownAnimationContainer), findsOneWidget);
  });
}
