
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.simple_app/models/user_model.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		if (email == 'zharfan@walturn.com' && password == 'abc123') {
			emit(Authenticated());
		} else {
			emit(Unauthenticated());
		}
	}

	void logout() {
		emit(Unauthenticated());
	}
}
