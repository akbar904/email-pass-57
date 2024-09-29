
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app/cubits/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
	final AuthCubit authCubit;

	const HomeScreen({Key? key, required this.authCubit}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Home Screen'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						authCubit.logout();
					},
					child: const Text('Logout'),
				),
			),
		);
	}
}
