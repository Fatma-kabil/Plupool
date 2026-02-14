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
import 'package:plupool/features/contact_us/presentation/views/admin_drawer_contact_us_view.dart';
import 'package:plupool/features/contact_us/presentation/views/company_res_contact_us_view.dart';
import 'package:plupool/features/contact_us/presentation/views/contact_us_details_view.dart';
import 'package:plupool/features/customers/presentation/views/add_customer_view.dart';
import 'package:plupool/features/customers/presentation/views/customer_profile_view.dart';
import 'package:plupool/features/customers/presentation/views/customers_view.dart';
import 'package:plupool/features/customers/presentation/views/edit_customer_pool_info.dart';
import 'package:plupool/features/customers/presentation/views/edit_customer_view.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/admin/admin_home_view.dart';
import 'package:plupool/features/home/presentaation/views/admin/see_all_packages_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/cusmoter_notification_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/offer_details_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/tech_notifications.dart';
import 'package:plupool/features/notes/presentation/views/company_res_notes_view.dart';
import 'package:plupool/features/notifications/presentation/views/add_notifications_view.dart';
import 'package:plupool/features/notifications/presentation/views/notification_inbox_view.dart';
import 'package:plupool/features/offers/presentation/views/add_offer_view.dart';
import 'package:plupool/features/offers/presentation/views/edit_offer_view.dart';
import 'package:plupool/features/offers/presentation/views/offer_view.dart';
import 'package:plupool/features/offers/presentation/views/product_offer_view.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/customer_order_details_view.dart';
import 'package:plupool/features/orders/presentation/view/customer_store_order_view.dart';
import 'package:plupool/features/orders/presentation/view/order_details_view.dart';
import 'package:plupool/features/orders/presentation/view/store_order_view.dart';
import 'package:plupool/features/packages/presentation/views/add_package_view.dart';
import 'package:plupool/features/packages/presentation/views/edit_package_view.dart';
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
import 'package:plupool/features/projects/presentation/views/add_project_view.dart';
import 'package:plupool/features/projects/presentation/views/admin_projects_view.dart';
import 'package:plupool/features/rating/presentation/views/admin_rating_view.dart';
import 'package:plupool/features/rating/presentation/views/customer_rating.dart';
import 'package:plupool/features/reports/admin_drawer_report_view.dart';
import 'package:plupool/features/reports/presentation/views/admin_reports_view.dart';
import 'package:plupool/features/search/presentation/views/search_view.dart';
import 'package:plupool/features/select_role/presentation/views/select_role_view.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/main_home_customer_view.dart';
import 'package:plupool/features/home/presentaation/views/tech/weekly_tasks_view.dart';
import 'package:plupool/features/maintenance/presentation/views/maintenance_service_view.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/construction_services_view.dart';
import 'package:plupool/features/consruction_service/presentation/views/reserve_construction_view.dart';
import 'package:plupool/features/services/presentation/views/admin/add_customer_service_view.dart';
import 'package:plupool/features/services/presentation/views/admin/customer_services_view.dart';
import 'package:plupool/features/services/presentation/views/admin/edit_customer_service_view.dart';
import 'package:plupool/features/services/presentation/views/admin/requested_service_view.dart';
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
import 'package:plupool/features/support/presentation/views/compny_res_support_view.dart';
import 'package:plupool/features/support/presentation/views/message_details.dart';
import 'package:plupool/features/tasks/presentation/views/customer_details_view.dart';
import 'package:plupool/features/tasks/presentation/views/maintenance_update_view.dart';
import 'package:plupool/features/tasks/presentation/views/tech_task_view.dart';
import 'package:plupool/features/technicains/presentation/views/add_tech_view.dart';
import 'package:plupool/features/technicains/presentation/views/edit_tech_view.dart';
import 'package:plupool/features/technicains/presentation/views/tech_profile_view.dart';
import 'package:plupool/features/technicains/presentation/views/techs_view.dart';
import 'package:plupool/features/visits/presentation/views/add_completed_visit_view.dart';
import 'package:plupool/features/visits/presentation/views/edit_completed_visit_view.dart';
import 'package:plupool/features/visits/presentation/views/visit_view.dart';

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
      pageBuilder: (context, state) => buildTransitionPage(const ProductView()),
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
          buildTransitionPage(const ProductOfferView()),
    ),
    GoRoute(
      path: '/adminratingview',
      name: 'adminratingview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminRatingView()),
    ),
    GoRoute(
      path: '/companyresprofile',
      name: 'companyresprofile',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompanyResProfile()),
    ),
    GoRoute(
      path: '/editcompanyresview',
      name: 'editcompanyresview',
      pageBuilder: (context, state) {
        //  final model = state.extra as CompanyModel; // استقبال الليست

        return buildTransitionPage(EditCompannyResView());
      },
    ),
    GoRoute(
      path: '/companyresnotesview',
      name: 'companyresnotesview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompanyResNotesView()),
    ),
    GoRoute(
      path: '/addnotificationsview',
      name: 'addnotificationsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddNotificationsView()),
    ),
    GoRoute(
      path: '/addcustomerserviceview',
      name: 'addcustomerserviceview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddCustomerServiceView()),
    ),
    GoRoute(
      path: '/editcustomerserviceview',
      name: 'editcustomerserviceview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditCustomerServiceView()),
    ),

    GoRoute(
      path: '/addpackageview',
      name: 'addpackageview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddPackageView()),
    ),
    GoRoute(
      path: '/editpackageview',
      name: 'editpackageview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditPackageView()),
    ),
    GoRoute(
      path: '/adminprojectview',
      name: 'adminprojectview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminProjectsView()),
    ),
    GoRoute(
      path: '/addprojectview',
      name: 'addprojectview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddProjectView()),
    ),
    GoRoute(
      path: '/customerstoreorderview',
      name: 'customerstoreorderview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomerStoreOrderView()),
    ),
    GoRoute(
      path: '/customerorderdetailsview',
      name: 'customerorderdetailsview',
      pageBuilder: (context, state) {
        final order = state.extra as OrderCardModel;
        return buildTransitionPage(CustomerOrderDetailsView(model: order));
      },
    ),
        GoRoute(
      path: '/customerratingview',
      name: 'customerratingview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CustomerRating()),
    ),
     GoRoute(
      path: '/visitview',
      name: 'visitview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const VisitView()),
    ),

     GoRoute(
      path: '/addcompletedvisitview',
      name: 'addcompletedvisitview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddCompletedVisitView()),
    ),
     GoRoute(
      path: '/editcompletedvisitview',
      name: 'editcompletedvisitview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditCompletedVisitView()),
    ),
     GoRoute(
      path: '/companyrescontactusview',
      name: 'companyrescontactusview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompanyResContactUsView()),
    ),
     GoRoute(
      path: '/contactusdetailsview',
      name: 'contactusdetailsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const ContactUsDetailsView()),
    ),
     GoRoute(
      path: '/compnyressupportview',
      name: 'compnyressupportview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const CompnyResSupportView()),
    ),
      GoRoute(
      path: '/requestedserviceview',
      name: 'requestedserviceview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const RequestedServiceView()),
    ),
     GoRoute(
      path: '/notificationinboxview',
      name: 'notificationinboxview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const NotificationInboxView()),
    ),
    GoRoute(
      path: '/editcustomerview',
      name: 'editcustomerview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditCustomerView()),
    ),
     GoRoute(
      path: '/editcustomerpoolinfo',
      name: 'editcustomerpoolinfo',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditCustomerPoolInfo()),
    ),
     GoRoute(
      path: '/techsview',
      name: 'techsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const TechsView()),
    ),
    GoRoute(
      path: '/addtechview',
      name: 'addtechview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AddTechView()),
    ),
     GoRoute(
      path: '/techprofileview',
      name: 'techprofileview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const TechProfileView()),
    ),
     GoRoute(
      path: '/edittechview',
      name: 'edittechview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const EditTechView()),
    ),
    GoRoute(
      path: '/adminreportsview',
      name: 'adminreportsview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminReportsView()),
    ),
     GoRoute(
      path: '/admindrawerreportview',
      name: 'admindrawerreportview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminDrawerReportView()),
    ),
         GoRoute(
      path: '/admindrawercontactusview',
      name: 'admindrawercontactusview',
      pageBuilder: (context, state) =>
          buildTransitionPage(const AdminDrawerContactUsView()),
    ),
  ],
);
