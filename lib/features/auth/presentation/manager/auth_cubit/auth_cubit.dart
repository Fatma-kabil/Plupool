
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/network/api_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage storage;
  final ApiService apiService;

  AuthCubit(this.storage, this.apiService)
      : super(AuthState.initial());

  /// التحقق من حالة المستخدم عند فتح التطبيق
  Future<void> checkAuth() async {
    final token = await storage.read(
      key: 'token',
    );

    // تحديث ApiService بالتوكن المحفوظ
    apiService.updateToken(token);

    if (token != null && token.isNotEmpty) {
      emit(
        state.copyWith(
          status: AuthStatus.loggedIn,
          token: token,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.guest,
          token: null,
        ),
      );
    }
  }

  /// تسجيل الدخول
  Future<void> login(String token) async {
    print('AuthCubit: login called with token: $token');

    await storage.write(
      key: 'token',
      value: token,
    );

    // تحديث ApiService بالتوكن الجديد
    apiService.updateToken(token);

    emit(
      state.copyWith(
        status: AuthStatus.loggedIn,
        token: token,
      ),
    );
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    await storage.delete(
      key: 'token',
    );

    await storage.delete(
      key: 'refresh_token',
    );

    // حذف التوكن من ApiService
    apiService.updateToken(null);

    emit(
      state.copyWith(
        status: AuthStatus.guest,
        token: null,
      ),
    );
  }
}