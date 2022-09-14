import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_exam/db/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  late final StreamSubscription<User?> authSubscription;

  AuthCubit({required this.authRepository}) : super(AuthState.initial()) {
    authSubscription = authRepository.user.listen((User? user) {
      authStateChanged(user);
    });
  }

  void authStateChanged(User? user) {
    if (user != null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.authenticated,
          user: user,
        ),
      );
    } else {
      emit(state.copyWith(
        authStatus: AuthStatus.unauthenticated,
        user: user,
      ));
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await authRepository.signInWithEmailAndPassword(email, password);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }
}
