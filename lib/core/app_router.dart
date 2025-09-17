
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/customer_setup_view.dart';
import 'package:plupool/features/auth/presentation/views/openning_view.dart';
import 'package:plupool/features/auth/presentation/views/select_role_view.dart';
import 'package:plupool/features/auth/presentation/views/sign_up_view.dart';
import 'package:plupool/features/auth/presentation/views/success_view.dart';
import 'package:plupool/features/auth/presentation/views/tech_setup_view.dart';
import 'package:plupool/features/auth/presentation/views/verification_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_wrapper.dart';



final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/splasherapper',
      name: 'splasherapper',
      builder: (context, state) => const SplashWrapper(),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashView(),
    ),
   
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardView(),
    ),
     GoRoute(
      path: '/openning',
      name: 'openning',
      builder: (context, state) => const OpenningView(),
    ),
     GoRoute(
      path: '/selectrole',
      name: 'selectrole',
      builder: (context, state) => const SelectRoleView(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignUpView(),
    ),
    
    GoRoute(
      path: '/verification',
      name: 'verification',
      builder: (context, state) => const VerificationView(),
    ),
     GoRoute(
      path: '/success',
      name: 'success',
      builder: (context, state) => const SuccessView(),
    ),
    GoRoute(
      path: '/customersetup',
      name: 'customersetup',
      builder: (context, state) => const CustomerSetupView(),
    ),
     GoRoute(
      path: '/',
      name: 'techsetup',
      builder: (context, state) => const TechSetupView(),
    ),
    
  ],
);
