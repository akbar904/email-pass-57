
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();
}

class Authenticated extends AuthState {
	final String email;
	final String password;

	const Authenticated(this.email, this.password);

	@override
	List<Object> get props => [email, password];
}

class Unauthenticated extends AuthState {
	const Unauthenticated();
}
