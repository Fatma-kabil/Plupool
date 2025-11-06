// lib/features/auth/data/datasources/auth_remote_data_source.dart
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/data/models/sign_up_company_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_pool_owner_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_technician_model.dart';

abstract class SignUpRemoteDataSource {
  Future<void> signupTechnician(TechnicianModel model);
  Future<void> signupPoolOwner(PoolOwnerModel model);
  Future<void> signupCompany(CompanyModel model);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService api;

  SignUpRemoteDataSourceImpl(this.api);

  @override
  Future<void> signupTechnician(TechnicianModel model) async {
    try {
      await api.post(
        Endpoints.signupTechnician,
        data: model.toJson(),
      );
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
  Future<void> signupPoolOwner(PoolOwnerModel model) async {
    try {
      await api.post(
        Endpoints.signupPoolOwner,
        data: model.toJson(),
      );
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
Future<void> signupCompany(CompanyModel model) async {
  try {
    print('🔗 SIGNUP URL = ${Endpoints.signupCompany}');
    print('📦 PAYLOAD = ${model.toJson()}');

    final response = await api.post(
      Endpoints.signupCompany,
      data: model.toJson(),
    );

    print('✅ RESPONSE STATUS = ${response.statusCode}');
    print('✅ RESPONSE DATA = ${response.data}');
  } catch (error) {
    print('❌ ERROR = $error');
    rethrow;
  }
}

  }

