// signup_view_body.dart

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
    return BlocBuilder<SelectRoleCubit, SelectRoleState>(
      builder: (context, state) {
        if (state is! GetRoleSuccess) {
          return const Center(child: CircularProgressIndicator());
        }

        final role = state.roleName;

        return BlocListener<OtpCubit, OtpState>(
          listener: (context, otpState) {
            if (otpState is OtpVerifiedSuccess) {
              final phoneState = _phoneInputFieldKey.currentState;
              if (phoneState == null) return;
              final fullPhone = phoneState.getFullPhoneNumber();

              if (role.contains("حمام")) {
                context.read<SignUpCubit>().signupPoolOwner(
                      PoolOwnerEntity(
                        otpCode: otpState.token,
                        fullName: _nameController.text.trim(),
                        phone: fullPhone,
                        address: _locationController.text.trim(),
                        profileImage: _profileImage?.path,
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
                        profileImage: _profileImage?.path,
                        otpCode: otpState.token,
                      ),
                    );
              } else if (role.contains("شركة") || role.contains("مطور")) {
                context.read<SignUpCubit>().signupCompany(
                      CompanyEntity(
                        fullName: _nameController.text.trim(),
                        phone: fullPhone,
                        profileImage: _profileImage?.path,
                        otpCode: otpState.token,
                      ),
                    );
              }
            }

            if (otpState is OtpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(otpState.message)),
              );
            }
          },
          child: Padding(
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
                    label:
                        'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
                  ),
                  SizedBox(height: SizeConfig.h(35)),

                  /// 🔹 BlocConsumer هنا عشان يعرض حالات OTP كلها
                  BlocConsumer<OtpCubit, OtpState>(
                    listener: (context, state) {
                      

                      if (state is OtpSentSuccess) {
                         showCustomSnackBar(
                        context: context,
                        message: '✅ تم إرسال الكود بنجاح',
                        isSuccess: true,
                      );
                        
                        setState(() => showVerificationBody = true);
                      }

                      if (state is OtpError) {
                        showCustomSnackBar(
                        context: context,
                        message: state.message,
                        isSuccess: false,
                      );
                      }
                    },
                    builder: (context, state) {
                      if (showVerificationBody) {
                        return VerificationBody(
                          phoneNumber:
                              _phoneInputFieldKey.currentState
                                      ?.getFullPhoneNumber() ??
                                  '',
                          btntext: 'إنشاء الحساب',
                          onVerify: (otpCode) {
                            final phoneState =
                                _phoneInputFieldKey.currentState;
                            if (phoneState == null) return;
                            context.read<OtpCubit>().verifyOtp(
                                  phoneState.getFullPhoneNumber(),
                                  otpCode,
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
          ),
        );
      },
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
    } else if (role.contains("شركة") || role.contains("مطور")) {
      return CompanyRespositiveForm(
        formKey: _formKey,
        nameController: _nameController,
        phoneController: _phoneController,
        phoneFieldKey: _phoneInputFieldKey,
        onImagePicked: (img) => _profileImage = img,
      );
    } else {
      return Center(child: Text('❌ لم يتم التعرف على نوع الحساب: $role'));
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

    /// إرسال OTP
    context.read<OtpCubit>().sendOtp(fullPhone);
  }
}
