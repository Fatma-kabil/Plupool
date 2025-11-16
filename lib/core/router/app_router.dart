import 'package:go_router/go_router.dart';
import 'package:plupool/core/router/page_transitions.dart'; // ✅ استيراد الـ helper
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_tech_view.dart';
import 'package:plupool/features/auth/presentation/views/privacy_policy_view.dart';
import 'package:plupool/features/auth/presentation/views/signup_view.dart';
import 'package:plupool/features/auth/presentation/views/login_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/tech_notifications.dart';
import 'package:plupool/features/profile/presentation/views/profile_details_view.dart';
import 'package:plupool/features/select_role/presentation/views/select_role_view.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_customer_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/weekly_tasks_view.dart';
import 'package:plupool/features/maintenance/presentation/views/maintenance_service_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/construction_services_view.dart';
import 'package:plupool/features/consruction_service/presentation/views/reserve_construction_view.dart';
import 'package:plupool/features/services/presentation/views/services_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_wrapper.dart';
import 'package:plupool/features/store/presentation/views/cart_view.dart';
import 'package:plupool/features/tasks/presentation/views/customer_details_view.dart';
import 'package:plupool/features/tasks/presentation/views/maintenance_update_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/splasherapper',
      name: 'splasherapper',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SplashWrapper()),
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
      path: '/selectrole',
      name: 'selectrole',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SelectRoleView()),
    ),

    GoRoute(
      path: '/signup',
      name: 'signup',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SignupView()),
    ),

     GoRoute(
      path: '/privacypolicy',
      name: 'privacypolicy',
      pageBuilder: (context, state) =>
          buildTransitionPage(const PrivacyPolicyView()),
    ),
    
    
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => buildTransitionPage(const LoginView()),
    ),

    GoRoute(
      path: '/MainHomeCustomerView',
      name: 'MainHomeCustomerView',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MainHomeCustomerView()),
    ),
    GoRoute(
      path: '/MainHomeTechView',
      name: 'MainHomeTechView',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MainHomeTechView()),
    ),
    GoRoute(
      path: '/servicesview',
      name: 'servicesview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ServicesView()),
    ),
    GoRoute(
      path: '/constructionservicesview',
      name: 'constructionservicesview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ConstructionServicesView()),
    ),
    GoRoute(
      path: '/reserveconstructionview',
      name: 'reserveconstructionview',
      pageBuilder: (context, state) {
        final pool = state.extra as PoolModel; // ✅ استقبلنا الموديل
        return buildTransitionPage(ReserveConstructionView(pool: pool));
      },
    ),
    GoRoute(
      path: '/maintenanceserviceview',
      name: 'maintenanceserviceview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MaintenanceServiceView()),
    ),
    GoRoute(
      path: '/weeklytasksview',
      name: 'weeklytasksview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const WeeklyTasksView()),
    ),
     GoRoute(
      path: '/profiledetailsview',
      name: 'profiledetailsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ProfileDetailsView()),
    ),
     GoRoute(
      path: '/customerdetailsView',
      name: 'customerdetailsView',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomerDetailsView()),
    ),
     GoRoute(
      path: '/maintenanceupdateview',
      name: 'maintenanceupdateview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MaintenanceUpdateView()),
    ),
    GoRoute(
      path: '/technotifications',
      name: 'technotifications',
      pageBuilder: (context, state) =>
          buildTransitionPage(const TechNotifications()),
    ),
     GoRoute(
      path: '/',
      name: 'cartview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CartView()),
    ),
  ],
);
