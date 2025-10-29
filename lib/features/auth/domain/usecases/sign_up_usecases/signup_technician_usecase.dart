// lib/features/auth/domain/usecases/signup_technician_usecase.dart


import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';

class SignupTechnicianUseCase {
  final SignUpRepo repository;

  SignupTechnicianUseCase(this.repository);

   Future<Either<Failure, Unit>> call(TechnicianEntity technician) async {
    return await repository.signupTechnician(technician);
  }
}
