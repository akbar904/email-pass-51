
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/login_cubit.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login Page'),
			),
			body: BlocProvider(
				create: (context) => LoginCubit(),
				child: Center(
					child: LoginForm(),
				),
			),
		);
	}
}
