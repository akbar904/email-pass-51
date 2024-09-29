
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/login_cubit.dart';

class LoginForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final TextEditingController emailController = TextEditingController();
		final TextEditingController passwordController = TextEditingController();

		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					TextField(
						controller: emailController,
						decoration: InputDecoration(
							labelText: 'Email',
						),
						keyboardType: TextInputType.emailAddress,
					),
					SizedBox(height: 16.0),
					TextField(
						controller: passwordController,
						decoration: InputDecoration(
							labelText: 'Password',
						),
						obscureText: true,
					),
					SizedBox(height: 16.0),
					ElevatedButton(
						onPressed: () {
							final String email = emailController.text;
							final String password = passwordController.text;
							context.read<LoginCubit>().login(email, password);
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
