import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';

abstract class SignUpRemoteDataSource {
  Future signupTechnician(TechnicianEntity entity);
  Future signupPoolOwner(PoolOwnerEntity entity);
  Future signupCompany(CompanyEntity entity);
}

class SignUpRemoteDataSourceImpl
    implements SignUpRemoteDataSource {
  final ApiService api;

  final storage = const FlutterSecureStorage();

  SignUpRemoteDataSourceImpl(this.api);

  @override
  Future signupTechnician(
    TechnicianEntity entity,
  ) async {
    try {
      final formData = FormData.fromMap({
        'phone': entity.phone,
        'otp_code': entity.otpCode,
        'full_name': entity.fullName,
        'address': entity.address,
        'skills': entity.skills.join(','),
        'years_of_experience':
            entity.yearsOfExperience,

        if (entity.latitude != null)
          'latitude': entity.latitude,

        if (entity.longitude != null)
          'longitude': entity.longitude,

        if (entity.profileImage != null)
          'profile_image':
              await MultipartFile.fromFile(
            entity.profileImage!,
            filename:
                entity.profileImage!.split('/').last,
          ),
      });

      final response = await api.post(
        Endpoints.signupTechnician,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      final accessToken =
          response.data['access_token'];

      final refreshToken =
          response.data['refresh_token'];

      await storage.write(
        key: 'token',
        value: accessToken,
      );

      await storage.write(
        key: 'refresh_token',
        value: refreshToken,
      );

      return accessToken;
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
  Future signupPoolOwner(
    PoolOwnerEntity entity,
  ) async {
    try {
      final formData = FormData.fromMap({
        'phone': entity.phone,
        'otp_code': entity.otpCode,
        'full_name': entity.fullName,
        'address': entity.address,

        if (entity.latitude != null)
          'latitude': entity.latitude,

        if (entity.longitude != null)
          'longitude': entity.longitude,

        if (entity.profileImage != null)
          'profile_image':
              await MultipartFile.fromFile(
            entity.profileImage!,
            filename:
                entity.profileImage!.split('/').last,
          ),
      });

      final response = await api.post(
        Endpoints.signupPoolOwner,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      final accessToken =
          response.data['access_token'];

      final refreshToken =
          response.data['refresh_token'];

      await storage.write(
        key: 'token',
        value: accessToken,
      );

      await storage.write(
        key: 'refresh_token',
        value: refreshToken,
      );

      return accessToken;
    } catch (error) {
      throw mapDioError(error);
    }
  }

  @override
  Future signupCompany(
    CompanyEntity entity,
  ) async {
    try {
      final formData = FormData.fromMap({
        'phone': entity.phone,
        'otp_code': entity.otpCode,
        'full_name': entity.fullName,

        if (entity.profileImage != null)
          'profile_image':
              await MultipartFile.fromFile(
            entity.profileImage!,
            filename:
                entity.profileImage!.split('/').last,
          ),
      });

      final response = await api.post(
        Endpoints.signupCompany,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      final accessToken =
          response.data['access_token'];

      final refreshToken =
          response.data['refresh_token'];

      await storage.write(
        key: 'token',
        value: accessToken,
      );

      await storage.write(
        key: 'refresh_token',
        value: refreshToken,
      );

      return accessToken;
    } catch (error) {
      throw mapDioError(error);
    }
  }
}
