
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/widgets/login_form.dart';
import 'package:com.example.simple_app/cubits/login_cubit.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		late LoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		testWidgets('renders email and password TextFields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<LoginCubit>(
							create: (_) => mockLoginCubit,
							child: LoginForm(),
						),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
		});

		testWidgets('renders login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<LoginCubit>(
							create: (_) => mockLoginCubit,
							child: LoginForm(),
						),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('calls login when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<LoginCubit>(
							create: (_) => mockLoginCubit,
							child: LoginForm(),
						),
					),
				),
			);

			await tester.enterText(find.byType(TextField).first, 'test@example.com');
			await tester.enterText(find.byType(TextField).last, 'password');
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockLoginCubit.login('test@example.com', 'password')).called(1);
		});
	});
}
