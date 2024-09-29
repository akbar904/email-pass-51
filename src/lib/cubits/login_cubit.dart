
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project_name/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void login(String email, String password) async {
		try {
			emit(LoginLoading());
			// Simulate network call
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password') {
				emit(LoginSuccess());
			} else {
				emit(LoginFailure('Invalid credentials'));
			}
		} catch (e) {
			emit(LoginFailure('An error occurred'));
		}
	}
}

abstract class LoginState extends Equatable {
	const LoginState();

	@override
	List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
	final String message;

	const LoginFailure(this.message);

	@override
	List<Object> get props => [message];
}
