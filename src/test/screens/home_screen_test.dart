
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock AuthCubit
class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});
	});

	group('HomeScreen Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('calls logout on AuthCubit when logout button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(authCubit: mockAuthCubit),
				),
			);

			await tester.tap(find.text('Logout'));
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
