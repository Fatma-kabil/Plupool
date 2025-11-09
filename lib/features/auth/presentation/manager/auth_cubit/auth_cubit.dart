import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage storage;

  AuthCubit(this.storage) : super(AuthState.initial());

  // 🔹 التحقق من التوكن عند تشغيل التطبيق
  Future<void> checkAuth() async {
    final token = await storage.read(key: 'token');
    if (token != null) {
      emit(AuthState(status: AuthStatus.loggedIn, token: token));
    } else {
      emit(AuthState(status: AuthStatus.guest));
    }
  }

  // 🔹 تسجيل الخروج
  Future<void> logout() async {
    await storage.delete(key: 'token');
    emit(AuthState(status: AuthStatus.guest));
  }

  // 🔹 تسجيل الدخول
  Future<void> login(String token) async {
    await storage.write(key: 'token', value: token);
    emit(AuthState(status: AuthStatus.loggedIn, token: token));
  }
}
