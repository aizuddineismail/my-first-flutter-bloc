part of 'auth_cubit.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? user;

  AuthState({
    required this.authStatus,
    this.user,
  });

  factory AuthState.initial() {
    return AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  List<Object> get props => [authStatus];

  @override
  String toString() => 'AuthState(authStatus: $authStatus, user: $user)';

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
