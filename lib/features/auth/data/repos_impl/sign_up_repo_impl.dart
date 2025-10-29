// lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/data/datasources/sign_up_remote_data_source.dart';
import 'package:plupool/features/auth/data/models/sign_up_company_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_pool_owner_model.dart';
import 'package:plupool/features/auth/data/models/sign_up_technician_model.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> signupTechnician(TechnicianEntity entity) async {
    try {
      final model = TechnicianModel.fromEntity(entity);
      await remoteDataSource.signupTechnician(model);
      return const Right(unit);
    } catch (error) {
      return Left(mapDioError(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signupPoolOwner(PoolOwnerEntity entity) async {
    try {
      final model = PoolOwnerModel.fromEntity(entity);
      await remoteDataSource.signupPoolOwner(model);
      return const Right(unit);
    } catch (error) {
      return Left(mapDioError(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signupCompany(CompanyEntity entity) async {
    try {
      final model = CompanyModel.fromEntity(entity);
      await remoteDataSource.signupCompany(model);
      return const Right(unit);
    } catch (error) {
      return Left(mapDioError(error));
    }
  }
}
