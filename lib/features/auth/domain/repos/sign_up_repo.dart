// lib/features/auth/domain/repositories/auth_repository.dart
import '../entities/Sign_up_entities/technician_entity.dart';
import '../entities/Sign_up_entities/pool_owner_entity.dart';
import '../entities/Sign_up_entities/company_entity.dart';

abstract class SignUpRepo {
  Future<void> signupTechnician(TechnicianEntity technician);
  Future<void> signupPoolOwner(PoolOwnerEntity poolOwner);
  Future<void> signupCompany(CompanyEntity company);
}
