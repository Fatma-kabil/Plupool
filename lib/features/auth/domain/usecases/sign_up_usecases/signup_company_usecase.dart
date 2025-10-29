// lib/features/auth/domain/usecases/signup_company_usecase.dart


import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';

class SignupCompanyUseCase {
  final SignUpRepo repository;

  SignupCompanyUseCase(this.repository);

 Future<Either<Failure, Unit>> call(CompanyEntity company) async {
    return await repository.signupCompany(company);
  }
}
