
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

class MockAuthState extends Mock implements AuthState {}

void main() {
	group('AuthState', () {
		test('AuthState can be instantiated', () {
			expect(AuthState(), isNotNull);
		});
	});
	
	group('AuthInitial', () {
		test('AuthInitial can be instantiated', () {
			expect(AuthInitial(), isNotNull);
		});
	});
	
	group('Authenticated', () {
		final email = 'zharfan@walturn.com';
		final password = 'abc123';
		
		test('Authenticated state can be instantiated with email and password', () {
			final state = Authenticated(email, password);
			expect(state, isNotNull);
			expect(state.email, email);
			expect(state.password, password);
		});
		
		test('Authenticated state supports value equality', () {
			final state1 = Authenticated(email, password);
			final state2 = Authenticated(email, password);
			expect(state1, equals(state2));
		});
		
		test('Authenticated state has correct props', () {
			final state = Authenticated(email, password);
			expect(state.props, [email, password]);
		});
	});
	
	group('Unauthenticated', () {
		test('Unauthenticated can be instantiated', () {
			expect(Unauthenticated(), isNotNull);
		});
		
		test('Unauthenticated state supports value equality', () {
			final state1 = Unauthenticated();
			final state2 = Unauthenticated();
			expect(state1, equals(state2));
		});
		
		test('Unauthenticated state has correct props', () {
			final state = Unauthenticated();
			expect(state.props, []);
		});
	});
}
