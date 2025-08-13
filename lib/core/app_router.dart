
import 'package:go_router/go_router.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';



final GoRouter appRouter = GoRouter(
  routes: [
     GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardView(),
    ),
    
  ],
);
