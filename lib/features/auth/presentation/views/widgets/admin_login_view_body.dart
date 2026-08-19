import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';

class AdminLoginViewBody extends StatefulWidget {
  const AdminLoginViewBody({super.key});

  @override
  State<AdminLoginViewBody> createState() =>
      _AdminLoginViewBodyState();
}

class _AdminLoginViewBodyState
    extends State<AdminLoginViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController phoneController =
      TextEditingController();

  final GlobalKey<PhoneInputFieldState>
      _phoneInputFieldKey =
      GlobalKey<PhoneInputFieldState>();

  bool showVerificationBody = false;

  String? phoneNumber;

  int _expiresIn = 30;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.w(22),
        right: SizeConfig.w(22),
        top: SizeConfig.h(50),
        bottom: SizeConfig.h(22),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'أدخل رقم الموبايل لتسجيل الدخول لحسابك',
              style: AppTextStyles.styleSemiBold20(
                context,
              ).copyWith(
                color: AppColors.ktextcolor,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: SizeConfig.h(40)),

            LoginForm(
              formKey: _formKey,
              phoneController: phoneController,
              phoneFieldKey: _phoneInputFieldKey,
            ),

            SizedBox(height: SizeConfig.h(15)),

            const WhatsappVerificationNote(),

            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) async {
                // ==========================================
                // OTP SENT SUCCESS
                // ==========================================

                if (state is OtpSentSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message:
                        '✅ تم إرسال الكود بنجاح عبر واتساب',
                    isSuccess: true,
                  );

                  setState(() {
                    _expiresIn =
                        state.response.expiresIn;

                    showVerificationBody = true;
                  });
                }

                // ==========================================
                // OTP VERIFIED SUCCESS
                // ==========================================

                else if (state is OtpVerifiedSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message:
                        '🎉 تم تسجيل الدخول بنجاح',
                    isSuccess: true,
                  );

                  // ========================================
                  // مفيش Notification هنا
                  //
                  // PlupoolApp هو المسؤول عن:
                  // - registerCurrentDevice
                  // - foreground listener
                  // - token refresh
                  // ========================================

                  await Future.delayed(
                    const Duration(seconds: 1),
                  );

                  if (!mounted) return;

                  context.go('/adminhomeview');
                }

                // ==========================================
                // OTP ERROR
                // ==========================================

                else if (state is OtpError) {
                  showCustomSnackBar(
                    context: context,
                    message: state.message,
                    isSuccess: false,
                  );
                }
              },

              builder: (context, state) {
                // ==========================================
                // SEND OTP
                // ==========================================

                if (!showVerificationBody) {
                  return Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.h(100),
                      ),

                      CustomTextBtn(
                        width: double.infinity,

                        text: state is OtpLoading
                            ? 'جاري الإرسال...'
                            : 'إرسال رمز التحقق',

                        onPressed: () {
                          if (_formKey.currentState!
                              .validate()) {
                            final number =
                                _phoneInputFieldKey
                                    .currentState
                                    ?.getFullPhoneNumber();

                            if (number == null ||
                                number.isEmpty) {
                              showCustomSnackBar(
                                context: context,
                                message:
                                    'الرجاء إدخال رقم هاتف صحيح',
                                isSuccess: false,
                              );

                              return;
                            }

                            phoneNumber = number;

                            context
                                .read<OtpCubit>()
                                .sendOtp(
                                  phoneNumber!,
                                  'login',
                                );
                          }
                        },
                      ),

                      SizedBox(
                        height: SizeConfig.h(70),
                      ),
                    ],
                  );
                }

                // ==========================================
                // VERIFY OTP
                // ==========================================

                else {
                  return Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.h(40),
                      ),

                      VerificationBody(
                        purpose: 'login',

                        expiresIn: _expiresIn,

                        phoneNumber:
                            phoneNumber ?? '',

                        btntext: state is OtpLoading
                            ? 'جارٍ التحقق...'
                            : 'تسجيل الدخول',

                        onVerify: (otpCode) {
                          context
                              .read<OtpCubit>()
                              .verifyOtp(
                                phoneNumber!,
                                otpCode,
                              );
                        },
                      ),

                      SizedBox(
                        height: SizeConfig.h(70),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}