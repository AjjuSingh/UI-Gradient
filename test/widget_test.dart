import 'package:flutter_test/flutter_test.dart';
import 'package:gradientx/Counter.dart';
import 'package:gradientx/MyWidget.dart';

void main() {
 testWidgets("My widget has title and message", (WidgetTester tester) async {
  // Create the widget by telling the test to build it
   await tester.pumpWidget(MyWidget(title: "Hello world", message: "Hey! You enjoying testing?"));
   final titleFinder = find.text("Hello world");
   final messageFinder = find.text("Hey! You enjoying testing?");
   expect(titleFinder, findsOneWidget);
   expect(messageFinder, findsOneWidget);

 });
}