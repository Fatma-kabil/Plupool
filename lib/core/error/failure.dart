import 'package:dio/dio.dart';

/// الأساس لكل الأخطاء
abstract class Failure {
  final String message;
  final int? code;
  const Failure(this.message, [this.code]);

  @override
  String toString() => '$runtimeType($code): $message';
}

/// أنواع الأخطاء المختلفة + رسائل افتراضية واضحة
class NetworkFailure extends Failure {
  const NetworkFailure([super.m = FailureMessages.network, super.c]);
}

class ServerFailure extends Failure {
  const ServerFailure([super.m = FailureMessages.server, super.c]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.m = FailureMessages.auth, super.c]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.m = FailureMessages.cache, super.c]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.m = FailureMessages.unknown, super.c]);
}

/// رسائل جاهزة وواضحة
class FailureMessages {
  static const network = 'مشكلة في الاتصال. تأكد من اتصالك بالإنترنت وحاول مرة أخرى.';
  static const server  = 'حدث خطأ من الخادم. برجاء المحاولة لاحقًا.';
  static const auth    = 'غير مصرح لك بالوصول. برجاء تسجيل الدخول مرة أخرى.';
  static const cache   = 'فشل في تحميل البيانات المخزنة. حاول إعادة التحديث.';
  static const unknown = 'حدث خطأ غير متوقع. برجاء إعادة المحاولة.';
}

/// دالة تحويل أخطاء Dio إلى Failure مناسب
Failure mapDioError(Object error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.cancel:
        return const UnknownFailure('تم إلغاء الطلب.');

      case DioExceptionType.badCertificate:
        return const UnknownFailure('شهادة غير موثوقة.');

      case DioExceptionType.badResponse:
        final status = error.response?.statusCode;
        final data = error.response?.data;

        print("========== ERROR RESPONSE ==========");
        print("Status: $status");
        print(data);
        print("===================================");

        String message = FailureMessages.server;

        if (data is Map<String, dynamic>) {
          if (data["detail"] != null) {
            message = data["detail"].toString();
          } else if (data["message"] != null) {
            message = data["message"].toString();
          } else if (data["error"] != null) {
            message = data["error"].toString();
          } else if (data["errors"] != null) {
            message = data["errors"].toString();
          }
        }

        if (status == 401 || status == 403) {
          return AuthFailure(message, status);
        }

        return ServerFailure(message, status);

      default:
        return UnknownFailure(error.message ?? FailureMessages.unknown);
    }
  }

  return UnknownFailure(error.toString());
}