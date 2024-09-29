
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/widgets/logout_button.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		testWidgets('should display logout button with correct text', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(),
					),
				),
			);

			// Act & Assert
			expect(find.text('Logout'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('should call logout on HomeCubit when tapped', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();
			when(() => mockHomeCubit.logout()).thenReturn(null);

			await tester.pumpWidget(
				BlocProvider<HomeCubit>(
					create: (_) => mockHomeCubit,
					child: MaterialApp(
						home: Scaffold(
							body: LogoutButton(),
						),
					),
				),
			);

			// Act
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Assert
			verify(() => mockHomeCubit.logout()).called(1);
		});
	});
}
