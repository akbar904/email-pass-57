
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'cubits/auth_cubit.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple App',
			home: BlocProvider(
				create: (_) => AuthCubit(),
				child: LoginScreen(),
			),
		);
	}
}
