import 'package:go_router/go_router.dart';
import 'package:plupool/core/router/page_transitions.dart'; // ✅ استيراد الـ helper
import 'package:plupool/features/auth/presentation/views/customer_setup_view.dart';
import 'package:plupool/features/auth/presentation/views/forget_password_screen.dart';
import 'package:plupool/features/auth/presentation/views/login_view.dart';
import 'package:plupool/features/auth/presentation/views/new_password_success.dart';
import 'package:plupool/features/auth/presentation/views/new_password_view.dart';
import 'package:plupool/features/auth/presentation/views/openning_view.dart';
import 'package:plupool/features/auth/presentation/views/select_role_view.dart';
import 'package:plupool/features/auth/presentation/views/sign_up_view.dart';
import 'package:plupool/features/auth/presentation/views/success_view.dart';
import 'package:plupool/features/auth/presentation/views/tech_setup_view.dart';
import 'package:plupool/features/auth/presentation/views/verification_forget_password_view.dart';
import 'package:plupool/features/auth/presentation/views/verification_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/main_home_customer_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_wrapper.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/splasherapper',
      name: 'splasherapper',
      pageBuilder: (context, state) => buildTransitionPage(const SplashWrapper()),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context, state) => buildTransitionPage(const SplashView()),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      pageBuilder: (context, state) => buildTransitionPage(const OnboardView()),
    ),
    GoRoute(
      path: '/openning',
      name: 'openning',
      pageBuilder: (context, state) => buildTransitionPage(const OpenningView()),
    ),
    GoRoute(
      path: '/selectrole',
      name: 'selectrole',
      pageBuilder: (context, state) => buildTransitionPage(const SelectRoleView()),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      pageBuilder: (context, state) => buildTransitionPage(const SignUpView()),
    ),
    GoRoute(
      path: '/verification',
      name: 'verification',
      pageBuilder: (context, state) => buildTransitionPage(const VerificationView()),
    ),
    GoRoute(
      path: '/success',
      name: 'success',
      pageBuilder: (context, state) => buildTransitionPage(const SuccessView()),
    ),
    GoRoute(
      path: '/customersetup',
      name: 'customersetup',
      pageBuilder: (context, state) => buildTransitionPage(const CustomerSetupView()),
    ),
    GoRoute(
      path: '/techsetup',
      name: 'techsetup',
      pageBuilder: (context, state) => buildTransitionPage(const TechSetupView()),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => buildTransitionPage(const LoginView()),
    ),
    GoRoute(
      path: '/forgetpassword',
      name: 'forgetpassword',
      pageBuilder: (context, state) => buildTransitionPage(const ForgetPasswordScreen()),
    ),
    GoRoute(
      path: '/verificationforgetpassword',
      name: 'verificationforgetpassword',
      pageBuilder: (context, state) => buildTransitionPage(const VerificationForgetPasswordView()),
    ),
    GoRoute(
      path: '/newpassword',
      name: 'newpassword',
      pageBuilder: (context, state) => buildTransitionPage(const NewPasswordView()),
    ),
    GoRoute(
      path: '/newpaswordsuccess',
      name: 'newpaswordsuccess',
      pageBuilder: (context, state) => buildTransitionPage(const NewPasswordSuccess()),
    ),
    GoRoute(
      path: '/',
      name: 'MainHomeCustomerView',
      pageBuilder: (context, state) => buildTransitionPage(const MainHomeCustomerView()),
    ),
  ],
);
