enum AuthStatus { guest, loggedIn }

class AuthState {
  final AuthStatus status;
  final String? token;

  AuthState({required this.status, this.token});

  factory AuthState.initial() => AuthState(status: AuthStatus.guest);
}
