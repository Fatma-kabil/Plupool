enum AuthStatus { guest, loggedIn }

class AuthState {
  final AuthStatus status;
  final String? token;

  AuthState({required this.status, this.token});

  factory AuthState.initial() => AuthState(status: AuthStatus.guest);

  AuthState copyWith({
    AuthStatus? status,
    String? token,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
