// lib/features/auth/domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

import '../entities/Sign_up_entities/technician_entity.dart';
import '../entities/Sign_up_entities/pool_owner_entity.dart';
import '../entities/Sign_up_entities/company_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, Unit>> signupTechnician(TechnicianEntity technician);
  Future<Either<Failure, Unit>> signupPoolOwner(PoolOwnerEntity poolOwner);
  Future<Either<Failure, Unit>> signupCompany(CompanyEntity company);
}
