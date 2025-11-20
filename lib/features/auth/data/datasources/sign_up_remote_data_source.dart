import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/data/models/sign_up_company_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_pool_owner_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_technician_model.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

abstract class SignUpRemoteDataSource {
  Future<String> signupTechnician(TechnicianModel model);
  Future<String> signupPoolOwner(PoolOwnerModel model);
  Future<String> signupCompany(CompanyModel model);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService api;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AuthCubit authCubit;

  SignUpRemoteDataSourceImpl(this.api, this.authCubit);

  @override
  Future<String> signupTechnician(TechnicianModel model) async {
    try {
      final response = await api.post(
        Endpoints.signupTechnician,
        data: model.toJson(),
      );

      final token = response.data['access_token'];
      await storage.write(key: 'token', value: token);
      authCubit.login(token);

      return token;
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
  Future<String> signupPoolOwner(PoolOwnerModel model) async {
    try {
      final response = await api.post(
        Endpoints.signupPoolOwner,
        data: model.toJson(),
      );

      final token = response.data['access_token'];
      await storage.write(key: 'token', value: token);
      authCubit.login(token);

      return token;
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
  Future<String> signupCompany(CompanyModel model) async {
    try {
      print('🔗 SIGNUP URL = ${Endpoints.signupCompany}');
      print('📦 PAYLOAD = ${model.toJson()}');

      final response = await api.post(
        Endpoints.signupCompany,
        data: model.toJson(),
      );

      print('✅ RESPONSE STATUS = ${response.statusCode}');
      print('✅ RESPONSE DATA = ${response.data}');

      final token = response.data['access_token'];

      // تخزين التوكن
      await storage.write(key: 'token', value: token);

      // تحديث الكيوبت
      authCubit.login(token);

      return token;

    } catch (error) {
      print('❌ ERROR = $error');
      throw mapDioError(error);
    }
  }
}
