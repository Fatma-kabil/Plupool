
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/login_view.dart';
import 'package:plupool/features/auth/presentation/views/openning_view.dart';
import 'package:plupool/features/auth/presentation/views/password_recovery.dart';
import 'package:plupool/features/auth/presentation/views/resset_password.dart';
import 'package:plupool/features/auth/presentation/views/select_role_view.dart';
import 'package:plupool/features/auth/presentation/views/sign_up_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';



final GoRouter appRouter = GoRouter(
  routes: [
   
    GoRoute(
      path: '/',
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
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),
     GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignUpView(),
    ),
     GoRoute(
      path: '/passwordrecovery',
      name: 'passwordrecovery',
      builder: (context, state) => const PasswordRecovery(),
    ),
    GoRoute(
      path: '/ressetpassword',
      name: 'ressetpassword',
      builder: (context, state) => const RessetPassword(),
    ),
    
  ],
);
