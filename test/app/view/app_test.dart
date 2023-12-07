import 'package:chat_app/app/app.dart';
import 'package:chat_app/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_picker/media_picker.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          mediaPicker: MediaPicker(),
        ),
      );
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
