import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_company_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_pool_owner_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_technician_usecase.dart';
import 'sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final SignupTechnicianUseCase signupTechnicianUseCase;
  final SignupPoolOwnerUseCase signupPoolOwnerUseCase;
  final SignupCompanyUseCase signupCompanyUseCase;

  SignUpCubit({
    required this.signupTechnicianUseCase,
    required this.signupPoolOwnerUseCase,
    required this.signupCompanyUseCase,
  }) : super(SignUpInitial());

  Future<void> signupTechnician(TechnicianEntity technician) async {
    emit(SignUpLoading());
    final result = await signupTechnicianUseCase(technician);
    result.fold(
      (Failure failure) => emit(SignUpFailure(failure.message)),
      (_) => emit(const SignUpSuccess("تم إنشاء الحساب بنجاح 👏")),
    );
  }

  Future<void> signupPoolOwner(PoolOwnerEntity owner) async {
    emit(SignUpLoading());
    final result = await signupPoolOwnerUseCase(owner);
    result.fold(
      (Failure failure) => emit(SignUpFailure(failure.message)),
      (_) => emit(const SignUpSuccess("تم إنشاء الحساب بنجاح 👏")),
    );
  }

  Future<void> signupCompany(CompanyEntity company) async {
    emit(SignUpLoading());
    final result = await signupCompanyUseCase(company);
    result.fold(
      (Failure failure) => emit(SignUpFailure(failure.message)),
      (_) => emit(const SignUpSuccess("تم إنشاء الحساب بنجاح 👏")),
    );
  }
}
