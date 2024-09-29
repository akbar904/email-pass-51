
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/main.dart';

void main() {
	group('Main', () {
		testWidgets('renders MyApp', (tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});
	});
}
