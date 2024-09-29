
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/home_cubit.dart';

class LogoutButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				context.read<HomeCubit>().logout();
			},
			child: Text('Logout'),
		);
	}
}
