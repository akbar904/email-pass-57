
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app/main.dart';
import 'package:flutter/material.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MyApp', () {
		testWidgets('renders LoginScreen initially', (tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.text('Login'), findsOneWidget);
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('zharfan@walturn.com', 'abc123'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Unauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
