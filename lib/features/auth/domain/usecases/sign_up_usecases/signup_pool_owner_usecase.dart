// lib/features/auth/domain/usecases/signup_pool_owner_usecase.dart


import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';

class SignupPoolOwnerUseCase {
  final SignUpRepo repository;

  SignupPoolOwnerUseCase(this.repository);

  Future<Either<Failure, Unit>> call(PoolOwnerEntity poolOwner) async {
    return await repository.signupPoolOwner(poolOwner);
  }
}
