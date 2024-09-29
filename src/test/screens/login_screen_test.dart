
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app/screens/login_screen.dart';
import 'package:bloc_test/bloc_test.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('Renders email and password TextFormFields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);
			
			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});
		
		testWidgets('Login button is present', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);
			
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'Emits Authenticated on successful login',
			build: () => authCubit,
			act: (cubit) => cubit.login('zharfan@walturn.com', 'abc123'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<AuthCubit, AuthState>(
			'Emits Unauthenticated on failed login',
			build: () => authCubit,
			act: (cubit) => cubit.login('wrong@walturn.com', 'wrongpassword'),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
