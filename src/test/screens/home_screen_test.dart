
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/screens/home_screen.dart';
import 'package:com.example.simple_app/cubits/home_cubit.dart';
import 'package:com.example.simple_app/widgets/logout_button.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display HomeScreen with logout button', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (context) => mockHomeCubit,
						child: HomeScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(HomeScreen), findsOneWidget);
			expect(find.byType(LogoutButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeCubit Tests', () {
		blocTest<HomeCubit, void>(
			'emits nothing when logout is called',
			build: () => MockHomeCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [],
		);
	});
}
