
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_app/models/user_model.dart';

void main() {
	group('UserModel', () {
		test('should create a user model with given email and password', () {
			final user = UserModel(email: 'zharfan@walturn.com', password: 'abc123');
			expect(user.email, 'zharfan@walturn.com');
			expect(user.password, 'abc123');
		});

		test('should properly serialize to JSON', () {
			final user = UserModel(email: 'zharfan@walturn.com', password: 'abc123');
			final json = user.toJson();
			expect(json, {'email': 'zharfan@walturn.com', 'password': 'abc123'});
		});

		test('should properly deserialize from JSON', () {
			final json = {'email': 'zharfan@walturn.com', 'password': 'abc123'};
			final user = UserModel.fromJson(json);
			expect(user.email, 'zharfan@walturn.com');
			expect(user.password, 'abc123');
		});
	});
}
