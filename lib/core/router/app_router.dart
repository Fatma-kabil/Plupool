import 'package:go_router/go_router.dart';
import 'package:plupool/core/router/page_transitions.dart'; // ✅ استيراد الـ helper
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_company_view.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_tech_view.dart';
import 'package:plupool/features/auth/data/models/sign_up_company_model.dart';
import 'package:plupool/features/auth/presentation/views/privacy_policy_view.dart';
import 'package:plupool/features/auth/presentation/views/signup_view.dart';
import 'package:plupool/features/auth/presentation/views/login_view.dart';
import 'package:plupool/features/company_res/presentation/views/add_company_res_view.dart';
import 'package:plupool/features/company_res/presentation/views/company_res_profile.dart';
import 'package:plupool/features/company_res/presentation/views/company_res_view.dart';
import 'package:plupool/features/company_res/presentation/views/edit_companny_res_view.dart';
import 'package:plupool/features/customers/presentation/views/add_customer_view.dart';
import 'package:plupool/features/customers/presentation/views/customer_profile_view.dart';
import 'package:plupool/features/customers/presentation/views/customers_view.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/admin/admin_home_view.dart';
import 'package:plupool/features/home/presentaation/views/admin/see_all_packages_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/cusmoter_notification_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/offer_details_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/tech_notifications.dart';
import 'package:plupool/features/offers/presentation/views/add_offer_view.dart';
import 'package:plupool/features/offers/presentation/views/edit_offer_view.dart';
import 'package:plupool/features/offers/presentation/views/offer_view.dart';
import 'package:plupool/features/offers/presentation/views/product_offer_view.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/order_details_view.dart';
import 'package:plupool/features/orders/presentation/view/store_order_view.dart';
import 'package:plupool/features/products/presentation/views/add_product_view.dart';
import 'package:plupool/features/products/presentation/views/edit_product_view.dart';
import 'package:plupool/features/products/presentation/views/product_view.dart';
import 'package:plupool/features/profile/presentation/views/delete_account_view.dart';
import 'package:plupool/features/profile/presentation/views/help_view.dart';
import 'package:plupool/features/profile/presentation/views/my_packages_view.dart';
import 'package:plupool/features/profile/presentation/views/my_projects_view.dart';
import 'package:plupool/features/profile/presentation/views/privacy_view.dart';
import 'package:plupool/features/profile/presentation/views/profile_details_view.dart';
import 'package:plupool/features/profile/presentation/views/profile_edit_view.dart';
import 'package:plupool/features/profile/presentation/views/why_us_view.dart';
import 'package:plupool/features/rating/presentation/views/admin_rating_view.dart';
import 'package:plupool/features/search/presentation/views/search_view.dart';
import 'package:plupool/features/select_role/presentation/views/select_role_view.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_customer_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/weekly_tasks_view.dart';
import 'package:plupool/features/maintenance/presentation/views/maintenance_service_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/construction_services_view.dart';
import 'package:plupool/features/consruction_service/presentation/views/reserve_construction_view.dart';
import 'package:plupool/features/services/presentation/views/admin/customer_services_view.dart';
import 'package:plupool/features/services/presentation/views/user/services_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';
import 'package:plupool/features/splash/presentation/views/splash_wrapper.dart';
import 'package:plupool/features/statistics/presentation/views/statistics_view.dart';
import 'package:plupool/features/store/data/models/product_model.dart';
import 'package:plupool/features/store/presentation/views/admin/admin_store_view.dart';
import 'package:plupool/features/store/presentation/views/cart_view.dart';
import 'package:plupool/features/store/presentation/views/order_summary_view.dart';
import 'package:plupool/features/support/data/models/message_model.dart';
import 'package:plupool/features/support/presentation/views/admin_support_view.dart';
import 'package:plupool/features/support/presentation/views/message_details.dart';
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
      pageBuilder: (context, state) => buildTransitionPage(const SignupView()),
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
      path: '/MainHomecompanyview',
      name: 'MainHomecompanyview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MainHomeCompanyView()),
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
      path: '/cartview',
      name: 'cartview',
      pageBuilder: (context, state) => buildTransitionPage(const CartView()),
    ),
    GoRoute(
      path: '/ordersummaryview',
      name: 'ordersummaryview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const OrderSummaryView()),
    ),
    GoRoute(
      path: '/searchview',
      name: 'searchview',
      pageBuilder: (context, state) => buildTransitionPage(const SearchView()),
    ),
    GoRoute(
      path: '/profileeditview',
      name: 'profileeditview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ProfileEditView()),
    ),
    GoRoute(
      path: '/deleteaccountview',
      name: 'deleteaccountview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const DeleteAccountView()),
    ),
    GoRoute(
      path: '/helpview',
      name: 'helpview',
      pageBuilder: (context, state) {
        final role = state.extra as String;

        return buildTransitionPage(HelpView(role: role));
      },
    ),
    GoRoute(
      path: '/privacyview',
      name: 'privacyview',
      pageBuilder: (context, state) => buildTransitionPage(const PrivacyView()),
    ),
    GoRoute(
      path: '/whyusview',
      name: 'whyusview',
      pageBuilder: (context, state) {
        // استلام الـ role من extra وتأكد من النوع String
        final role = state.extra as String;

        return buildTransitionPage(WhyUsView(role: role));
      },
    ),

    GoRoute(
      path: '/mypackageview',
      name: 'mypackageview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MyPackagesView()),
    ),
    GoRoute(
      path: '/offerdetailsview',
      name: 'offerdetailsview',
      pageBuilder: (context, state) {
        final offers = state.extra as List<OfferModel>; // استقبال الليست

        return buildTransitionPage(
          OfferDetailsView(offers: offers), // تمرير الليست للصفحة
        );
      },
    ),
    GoRoute(
      path: '/myprojectsview',
      name: 'myprojectsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const MyProjectsView()),
    ),

    GoRoute(
      path: '/customernotificationview',
      name: 'customernotificationview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CusmoterNotificationView()),
    ),
    GoRoute(
      path: '/',
      name: 'adminhomeview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminHomeView()),
    ),
    GoRoute(
      path: '/seeallpackagesview',
      name: 'seeallpackagesview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SeeAllPackagesView()),
    ),
    GoRoute(
      path: '/statisticsview',
      name: 'statisticsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const StatisticsView()),
    ),
    GoRoute(
      path: '/offerview',
      name: 'offerview',
      pageBuilder: (context, state) => buildTransitionPage(const OfferView()),
    ),
    GoRoute(
      path: '/addofferview',
      name: 'addofferview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddOfferView()),
    ),
    GoRoute(
      path: '/editofferview',
      name: 'editofferview',
      pageBuilder: (context, state) {
        final offer = state.extra as OfferModel; // استقبال الليست

        return buildTransitionPage(EditOfferView(offer: offer));
      },
    ),
    GoRoute(
      path: '/customersview',
      name: 'customersview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomersView()),
    ),
    GoRoute(
      path: '/addcustomerview',
      name: 'addcustomerview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddCustomerView()),
    ),
    GoRoute(
      path: '/customerprofileview',
      name: 'customerprofileview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomerProfileView()),
    ),
    GoRoute(
      path: '/customerservicesview',
      name: 'customerservicesview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomerServicesView()),
    ),
    GoRoute(
      path: '/adminsupportview',
      name: 'adminsupportview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminSupportView()),
    ),
    GoRoute(
      path: '/messagedetails',
      name: 'messagedetails',
      pageBuilder: (context, state) {
        final message = state.extra as MessageModel; // استقبال الليست

        return buildTransitionPage(MessageDetails(message: message));
      },
    ),
    GoRoute(
      path: '/adminstoreview',
      name: 'adminstoreview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminStoreView()),
    ),
    GoRoute(
      path: '/storeorderview',
      name: 'storeorderview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const StoreOrderView()),
    ),
    GoRoute(
      path: '/orderdetailsview',
      name: 'orderdetailsview',
      pageBuilder: (context, state) {
        final order = state.extra as OrderCardModel; // استقبال الليست

        return buildTransitionPage(OrderDetailsView(model: order));
      },
    ),
     GoRoute(
      path: '/productview',
      name: 'productview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ProductView()),
    ),
      GoRoute(
      path: '/editproductview',
      name: 'editproductview',
      pageBuilder: (context, state) {
        final product = state.extra as ProductModel; // استقبال الليست

        return buildTransitionPage(EditProductView(product: product));
      },
    ),
     GoRoute(
      path: '/addproductview',
      name: 'addproductview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddProductView()),
    ),
     GoRoute(
      path: '/companyresview',
      name: 'companyresview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompanyResView()),
    ),
     GoRoute(
      path: '/addcompanyres',
      name: 'addcompanyres',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddCompanyRes()),
    ),
     GoRoute(
      path: '/productofferview',
      name: 'productofferview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ProductOfferView()  )
    ),
     GoRoute(
      path: '/adminratingview',
      name: 'adminratingview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminRatingView()  )
    ),
     GoRoute(
      path: '/companyresprofile',
      name: 'companyresprofile',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompanyResProfile()  )
    ),
      GoRoute(
      path: '/editcompanyresview',
      name: 'editcompanyresview',
      pageBuilder: (context, state) {
        final model = state.extra as CompanyModel; // استقبال الليست

        return buildTransitionPage(EditCompannyResView(model: model));
      },
    ),
  ],
);
