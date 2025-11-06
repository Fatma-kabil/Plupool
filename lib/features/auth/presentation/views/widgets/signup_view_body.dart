import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';
import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';
import 'package:plupool/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/company_responsitive_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_signup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/tech_setup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool acceptedTerms = false;
  bool showVerificationBody = false;
  String _enteredOtpCode = '';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _buildController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<PhoneInputFieldState> _phoneInputFieldKey =
      GlobalKey<PhoneInputFieldState>();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    context.read<SelectRoleCubit>().getSavedRole();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _buildController.dispose();
    _workController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUpSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم إنشاء الحساب بنجاح 🎉',
            isSuccess: true,
          );
          await Future.delayed(const Duration(seconds: 2));
          // ignore: use_build_context_synchronously
          final role = context.read<SelectRoleCubit>().state;
          if (role is GetRoleSuccess && role.roleName.contains("فني")) {
            // ignore: use_build_context_synchronously
            context.go('/MainHomeTechView');
          } else {
            // ignore: use_build_context_synchronously
            context.go('/MainHomeCustomerView');
          }
        } else if (state is SignUpFailure) {
          showCustomSnackBar(
            context: context,
            message: state.error,
            isSuccess: false,
          );
        }
      },
      child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, state) {
          if (state is! GetRoleSuccess) {
            return const Center(child: CircularProgressIndicator());
          }

          final role = state.roleName;

          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(22),
              horizontal: SizeConfig.w(18),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SignupHeader(),
                  SizedBox(height: SizeConfig.h(15)),
                  _buildSignupForm(role),
                  SizedBox(height: SizeConfig.h(20)),
                  const WhatsappVerificationNote(),
                  SizedBox(height: SizeConfig.h(40)),

                  CustomCheckbox(
                    value: acceptedTerms,
                    onChanged: (val) => setState(() => acceptedTerms = val),
                    label: 'الشروط وسياسة الاستخدام',
                  ),

                  SizedBox(height: SizeConfig.h(35)),

                  BlocConsumer<OtpCubit, OtpState>(
                    listener: (context, state) {
                      if (state is OtpSentSuccess) {
                        showCustomSnackBar(
                          context: context,
                          message: '✅ تم إرسال الكود بنجاح عبر واتساب',
                          isSuccess: true,
                        );
                        setState(() => showVerificationBody = true);
                      } else if (state is OtpError) {
                        showCustomSnackBar(
                          context: context,
                          message: state.message,
                          isSuccess: false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (showVerificationBody) {
                        return BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, signUpState) {
                            return VerificationBody(
                              phoneNumber:
                                  _phoneInputFieldKey.currentState
                                      ?.getFullPhoneNumber() ??
                                  '',
                              btntext: signUpState is SignUpLoading
                                  ? 'جاري إنشاء الحساب...'
                                  : 'إنشاء الحساب',
                              onVerify: signUpState is SignUpLoading?
                                  ? (String _) {}
                                  : _onSignupPressed,
                            );
                          },
                        );
                      }

                      return CustomTextBtn(
                        width: double.infinity,
                        text: state is OtpLoading
                            ? 'جاري الإرسال...'
                            : 'إرسال رمز التحقق',
                        onPressed: state is OtpLoading
                            ? null
                            : _onSendVerificationPressed,
                      );
                    },
                  ),

                  SizedBox(height: SizeConfig.h(40)),

                  AuthSwitchRow(
                    leadingText: 'لدي حساب بالفعل',
                    actionText: 'تسجيل الدخول',
                    onTap: () => context.push('/login'),
                  ),
                  SizedBox(height: SizeConfig.h(40)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSignupForm(String role) {
    if (role.contains("حمام")) {
      return CustomerSignupForm(
        formKey: _formKey,
        nameController: _nameController,
        locationController: _locationController,
        phoneController: _phoneController,
        phoneFieldKey: _phoneInputFieldKey,
        onImagePicked: (img) => _profileImage = img,
      );
    } else if (role.contains("فني")) {
      return TechSetupForm(
        formKey: _formKey,
        nameController: _nameController,
        locationController: _locationController,
        phoneController: _phoneController,
        phoneFieldKey: _phoneInputFieldKey,
        buildController: _buildController,
        workController: _workController,
        onImagePicked: (img) => _profileImage = img,
      );
    } else {
      return CompanyRespositiveForm(
        formKey: _formKey,
        nameController: _nameController,
        phoneController: _phoneController,
        phoneFieldKey: _phoneInputFieldKey,
        onImagePicked: (img) => _profileImage = img,
      );
    }
  }

  void _onSendVerificationPressed() {
    if (!_formKey.currentState!.validate()) return;

    if (!acceptedTerms) {
      showCustomSnackBar(
        context: context,
        message: 'يجب الموافقة على الشروط والأحكام',
        isSuccess: false,
      );
      return;
    }

    final phoneState = _phoneInputFieldKey.currentState;
    if (phoneState == null) {
      showCustomSnackBar(
        context: context,
        message: 'يرجى إدخال رقم الهاتف أولاً',
        isSuccess: false,
      );
      return;
    }

    final fullPhone = phoneState.getFullPhoneNumber();
    context.read<OtpCubit>().sendOtp(fullPhone);
  }

  void _onSignupPressed(String otpCode) {
    setState(() => _enteredOtpCode = otpCode);

    final phoneState = _phoneInputFieldKey.currentState;
    if (phoneState == null) return;

    final fullPhone = phoneState.getFullPhoneNumber();
    //   final cleanedPhone = fullPhone.replaceFirst('+2', '');

    final role =
        (context.read<SelectRoleCubit>().state as GetRoleSuccess).roleName;

    if (role.contains("حمام")) {
      context.read<SignUpCubit>().signupPoolOwner(
        PoolOwnerEntity(
          otpCode: otpCode,
          fullName: _nameController.text.trim(),
          phone: fullPhone,
          address: _locationController.text.trim(),
          profileImage: _profileImage?.path ?? "string",
        ),
      );
    } else if (role.contains("فني")) {
      final skillsList = _buildController.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      final years = int.tryParse(_workController.text.trim()) ?? 0;

      context.read<SignUpCubit>().signupTechnician(
        TechnicianEntity(
          fullName: _nameController.text.trim(),
          phone: fullPhone,
          address: _locationController.text.trim(),
          skills: skillsList,
          yearsOfExperience: years,
          profileImage: _profileImage?.path ?? "string",

          otpCode: otpCode,
        ),
      );
    } else if (role.contains("شركة") || role.contains("مطور")) {
      context.read<SignUpCubit>().signupCompany(
        CompanyEntity(
          fullName: _nameController.text.trim(),
          phone: fullPhone,
          profileImage: _profileImage?.path ?? "",

          otpCode: otpCode,
        ),
      );
    }
  }
}
