
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/screens/login_screen.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginScreen', () {
		testWidgets('should display the Login form', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			
			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('should have a title Login Page', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			
			expect(find.text('Login Page'), findsOneWidget);
		});
	});

	group('LoginCubit', () {
		late MockLoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		blocTest<MockLoginCubit, LoginState>(
			'emits [] when nothing is added',
			build: () => mockLoginCubit,
			expect: () => [],
		);

		blocTest<MockLoginCubit, LoginState>(
			'emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => mockLoginCubit,
			act: (cubit) => cubit.login('email@test.com', 'password123'),
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<MockLoginCubit, LoginState>(
			'emits [LoginLoading, LoginFailure] when login fails',
			build: () => mockLoginCubit,
			act: (cubit) => cubit.login('email@test.com', 'wrongpassword'),
			expect: () => [LoginLoading(), LoginFailure()],
		);
	});
}
