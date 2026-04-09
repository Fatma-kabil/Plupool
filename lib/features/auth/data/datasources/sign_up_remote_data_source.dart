import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

abstract class SignUpRemoteDataSource {
  Future<String> signupTechnician(TechnicianEntity entity);
  Future<String> signupPoolOwner(PoolOwnerEntity entity);
  Future<String> signupCompany(CompanyEntity entity);
}


class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService api;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AuthCubit authCubit;

  SignUpRemoteDataSourceImpl(this.api, this.authCubit);

  @override
 @override
Future<String> signupTechnician(TechnicianEntity entity) async {
  try {
    final formData = FormData.fromMap({
      'phone': entity.phone,
      'otp_code': entity.otpCode,
      'full_name': entity.fullName,
      'address': entity.address,
      'skills': entity.skills.join(','),
      'years_of_experience': entity.yearsOfExperience,
      'latitude': entity.latitude,
      'longitude': entity.longitude,

      if (entity.profileImage != null)
        'profile_image': await MultipartFile.fromFile(
          entity.profileImage!,
          filename: entity.profileImage!.split('/').last,
        ),
    });

    final response = await api.post(
      Endpoints.signupTechnician,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
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
  @override
Future<String> signupPoolOwner(PoolOwnerEntity entity) async {
  try {
    final formData = FormData.fromMap({
      'phone': entity.phone,
      'otp_code': entity.otpCode,
      'full_name': entity.fullName,
      'address': entity.address,
      'latitude': entity.latitude ?? 0.0,
  'longitude': entity.longitude ?? 0.0,


      if (entity.profileImage != null)
        'profile_image': await MultipartFile.fromFile(
          entity.profileImage!,
          filename: entity.profileImage!.split('/').last,
        ),
    });

    final response = await api.post(
      Endpoints.signupPoolOwner,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
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
  @override
Future<String> signupCompany(CompanyEntity entity) async {
  try {
    final formData = FormData.fromMap({
      'phone': entity.phone,
      'otp_code': entity.otpCode,
      'full_name': entity.fullName,
      if (entity.profileImage != null)
        'profile_image': await MultipartFile.fromFile(
          entity.profileImage!,
          filename: entity.profileImage!.split('/').last,
        ),
    });

    final response = await api.post(
      Endpoints.signupCompany,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    final token = response.data['access_token'];
    await storage.write(key: 'token', value: token);
    authCubit.login(token);

    return token;
  } catch (error) {
    throw mapDioError(error);
  }
}

}
