
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/cubits/login_cubit.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;
		
		setUp(() {
			loginCubit = MockLoginCubit();
		});
		
		tearDown(() {
			loginCubit.close();
		});
		
		test('initial state is LoginInitial', () {
			expect(loginCubit.state, equals(LoginInitial()));
		});
		
		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				LoginLoading(),
				LoginSuccess(),
			],
		);
		
		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [
				LoginLoading(),
				LoginFailure('Invalid credentials'),
			],
		);
	});
}
