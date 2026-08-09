import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/services/notification_service.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

import '../../../../notifications/presentation/manager/notification_cubit/notification_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<PhoneInputFieldState> _phoneInputFieldKey =
      GlobalKey<PhoneInputFieldState>();
  bool showVerificationBody = false;
  String? phoneNumber; // هنا خزني رقم الهاتف

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
              ).copyWith(color: AppColors.ktextcolor),
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
                if (state is OtpSentSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message: '✅ تم إرسال الكود بنجاح عبر واتساب',
                    isSuccess: true,
                  );
                  setState(() {
                    _expiresIn = state.response.expiresIn;
                    showVerificationBody = true;
                  });
                } else if (state is OtpVerifiedSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message: '🎉 تم تسجيل الدخول بنجاح',
                    isSuccess: true,
                  );
                  await sl<NotificationCubit>().registerCurrentDevice();

                  NotificationService.instance.startForegroundListener(
                    onNotificationReceived: () {
                      sl<NotificationCubit>().getNotifications();
                    },
                  );

                  NotificationService.instance.startTokenRefreshListener(
                    onTokenRefresh: (newToken) async {
                      final deviceId = await NotificationService.instance
                          .getDeviceId();

                      await sl<NotificationCubit>().registerDevice(
                        token: newToken,
                        platform: NotificationService.instance.platform,
                        deviceId: deviceId,
                      );
                    },
                  );
                  await Future.delayed(const Duration(seconds: 1));

                  if (!mounted) return;

                  await context.read<SelectRoleCubit>().getSavedRole();

                  final roleState = context.read<SelectRoleCubit>().state;
                  String roleName = '';

                  if (roleState is GetRoleSuccess) {
                    roleName = roleState.roleName;
                  }

                  if (roleName.contains("فني")) {
                    context.go('/MainHomeTechView');
                  } else {
                    context.go('/MainHomeCustomerView');
                  }
                } else if (state is OtpError) {
                  showCustomSnackBar(
                    context: context,
                    message: state.message,
                    isSuccess: false,
                  );
                }
              },
              builder: (context, state) {
                if (!showVerificationBody) {
                  return Column(
                    children: [
                      SizedBox(height: SizeConfig.h(100)),
                      CustomTextBtn(
                        width: double.infinity,
                        text: state is OtpLoading
                            ? 'جاري الإرسال...'
                            : 'إرسال رمز التحقق',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final number = _phoneInputFieldKey.currentState
                                ?.getFullPhoneNumber();

                            if (number == null || number.isEmpty) {
                              showCustomSnackBar(
                                context: context,
                                message: 'الرجاء إدخال رقم هاتف صحيح',
                                isSuccess: false,
                              );
                              return; // ما تكملش لو الرقم غير صالح
                            }

                            phoneNumber = number; // خزنه بس لما يكون صحيح
                            context.read<OtpCubit>().sendOtp(phoneNumber!);
                          }
                        },
                      ),
                      SizedBox(height: SizeConfig.h(70)),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(height: SizeConfig.h(40)),
                      VerificationBody(
                        expiresIn: _expiresIn,
                        phoneNumber: phoneNumber ?? '',
                        btntext: state is OtpLoading
                            ? 'جارٍ التحقق...'
                            : 'تسجيل الدخول',
                        onVerify: (otpCode) {
                          context.read<OtpCubit>().verifyOtp(
                            phoneNumber!,
                            otpCode,
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.h(70)),
                    ],
                  );
                }
              },
            ),

            AuthSwitchRow(
              leadingText: 'ليس لدي حساب',
              actionText: 'إنشاء حساب',
              onTap: () {
                context.go('/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
