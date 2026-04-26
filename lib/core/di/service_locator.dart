import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/auth/data/datasources/otp_remote_data_source.dart';
import 'package:plupool/features/auth/data/repos_impl/otp_repo_impl.dart';
import 'package:plupool/features/auth/data/repos_impl/sign_up_repo_impl.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:plupool/features/home/data/remote_data_sources/notification_remote_data_source.dart';
import 'package:plupool/features/home/data/repos_impl/notification_repo_impl.dart';

import 'package:plupool/features/home/domain/repos/notification_repo.dart';
import 'package:plupool/features/home/presentaation/manager/notification_cubit/notification_cubit.dart';
import 'package:plupool/features/offers/data/remote_data_sources/offer_remote_data_source.dart';
import 'package:plupool/features/offers/data/remote_data_sources/product_offer_remote_data_source.dart';
import 'package:plupool/features/offers/data/repos_impl/offer_repo_impl.dart';
import 'package:plupool/features/offers/data/repos_impl/product_offer_repo_impl.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';
import 'package:plupool/features/offers/domain/repos/product_offer_repo.dart';
import 'package:plupool/features/offers/domain/usecases/add_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/add_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/delete_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/delete_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/get_all_offers_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/get_products_offers.dart';
import 'package:plupool/features/offers/domain/usecases/update_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/update_product_offer_usecase.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/products/data/remote_data_sources/product_remote_data_source.dart';
import 'package:plupool/features/products/data/repos_impl/product_repo_impl.dart';
import 'package:plupool/features/products/domain/repos/product_repo.dart';
import 'package:plupool/features/products/domain/usecases/add_product_usecase.dart';
import 'package:plupool/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:plupool/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:plupool/features/products/domain/usecases/update_product_usecase.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/profile/data/remote_data_source.dart/user_remote_data_source.dart';
import 'package:plupool/features/profile/data/repo_impl/user_repo_impl.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/rating/data/data_sources/ratings_remote_data_source.dart';
import 'package:plupool/features/rating/data/repos_impl/ratings_repo_impl.dart';
import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';
import 'package:plupool/features/rating/domain/usecases/approve_rating.dart';
import 'package:plupool/features/rating/domain/usecases/delete_rating_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/get_rating_by_id_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/get_ratings_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/reject_rating.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/search/data/data_sources/product_search_remote_data_source.dart';
import 'package:plupool/features/search/data/repositories_impl/product_search_repository_impl.dart';
import 'package:plupool/features/search/domain/repositories/product_search_repo.dart';
import 'package:plupool/features/search/domain/usecases/search_products_usecase.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_cubit.dart';
import 'package:plupool/features/services/data/remote_data_source/requested_services_remote_ds.dart';
import 'package:plupool/features/services/data/repos_impl/requested_services_repo_impl.dart';
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';
import 'package:plupool/features/services/domain/usecases/delete_request_usecase.dart';
import 'package:plupool/features/services/domain/usecases/get_request_details.dart';
import 'package:plupool/features/services/domain/usecases/get_requests_usecase.dart';
import 'package:plupool/features/services/domain/usecases/update_request_statue.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/support/domain/usecases/delete_message_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_message_details_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_messages_usecase.dart';
import 'package:plupool/features/support/domain/usecases/update_status_usecase.dart';

// Role Feature
import 'package:plupool/features/select_role/data/local_data_source/role_local_data_source.dart';
import 'package:plupool/features/select_role/domain/repos/role_repo.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/select_role/data/repos_impl/role_repo_impl.dart';

// Auth Feature
import 'package:plupool/features/auth/data/datasources/sign_up_remote_data_source.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_company_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_pool_owner_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_technician_usecase.dart';
import 'package:plupool/features/services/data/remote_data_source/booking_remote_data_source.dart';
import 'package:plupool/features/services/data/repos_impl/booking_repo_impl.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';
import 'package:plupool/features/services/domain/usecases/delete_booking_usecase.dart';
import 'package:plupool/features/services/domain/usecases/get_booking_details.dart';
import 'package:plupool/features/services/domain/usecases/get_bookings_usecase.dart';
import 'package:plupool/features/services/domain/usecases/update_booking_usecase.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/settening/data/date_sources/faq_remote_data_source.dart';
import 'package:plupool/features/settening/data/repos_impl/faq_repo_impl.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';
import 'package:plupool/features/settening/domain/usecases/create_faq_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/delete_faq_usecse.dart';
import 'package:plupool/features/settening/domain/usecases/get_all_faqs_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/get_faq_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/toggel_faq_visability_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/update_faq_usecase.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/statistics/data/data_sources/dashboard_remote_data_source.dart';
import 'package:plupool/features/statistics/data/repos_impl/dashboard_repository_impl.dart';
import 'package:plupool/features/statistics/domain/repos/dashboard_repo.dart';
import 'package:plupool/features/statistics/domain/usecases/get_admin_statistics_usecase.dart';
import 'package:plupool/features/statistics/presentation/manaager/cubits/dashboard_cubit.dart';
import 'package:plupool/features/store/data/data_sources/category_remote_data_source.dart';
import 'package:plupool/features/store/data/data_sources/store_statistics_remote_datasource.dart';
import 'package:plupool/features/store/data/repos_impl/category_repository_impl.dart';
import 'package:plupool/features/store/data/repos_impl/store_statistics_repo_impl.dart';
import 'package:plupool/features/store/domain/repos/category_repository.dart';
import 'package:plupool/features/store/domain/repos/store_statistics_repo.dart';
import 'package:plupool/features/store/domain/usecases/get_categories_usecase.dart';
import 'package:plupool/features/store/domain/usecases/get_store_statistics_usecase.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_cubit.dart';
import 'package:plupool/features/support/data/remote_data_sources/contact_remote_data_source.dart';
import 'package:plupool/features/support/data/repos_impl.dart/contact_repo_impl.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/domain/repos/contact_repo.dart';
final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // ----------------------------
  // 🌐 Core Network
  // ----------------------------
  sl.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://192.168.43.149:8000/api/v1',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  });

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  // ----------------------------
  // 🔐 FlutterSecureStorage
  // ----------------------------
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // ----------------------------
  // 🧱 Role Feature
  // ----------------------------
  sl.registerLazySingleton<RoleLocalDataSource>(() => RoleLocalDataSource());

  sl.registerLazySingleton<RoleRepository>(
    () => RoleRepositoryImpl(sl<RoleLocalDataSource>()),
  );

  sl.registerLazySingleton(() => SaveRoleUseCase(sl<RoleRepository>()));
  sl.registerLazySingleton(() => GetSavedRoleUseCase(sl<RoleRepository>()));

  sl.registerLazySingleton(() => SelectRoleCubit(
        saveRoleUseCase: sl<SaveRoleUseCase>(),
        getSavedRoleUseCase: sl<GetSavedRoleUseCase>(),
      ));

  // ----------------------------
  // 🔐 Auth Feature
  // ----------------------------
  // AuthCubit (يعتمد على FlutterSecureStorage)
  sl.registerLazySingleton<AuthCubit>(
  () => AuthCubit(sl<FlutterSecureStorage>(), sl<ApiService>()),
);


  // Remote Data Source
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl<ApiService>(), sl<AuthCubit>(), ),
  );

  // Repositories
  sl.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(sl<SignUpRemoteDataSource>()),
  );

  sl.registerLazySingleton<OtpRemoteDataSource>(
    () => OtpRemoteDataSourceImpl(
          sl<ApiService>(),
          sl<AuthCubit>(), // ✅ تمرير الـ AuthCubit
        ),
  );

  sl.registerLazySingleton<OtpRepository>(
    () => OtpRepoImpl(sl<OtpRemoteDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(() => SignupTechnicianUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupPoolOwnerUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupCompanyUseCase(sl<SignUpRepo>()));

  // Cubits
  sl.registerLazySingleton(() => SignUpCubit(
        signupTechnicianUseCase: sl<SignupTechnicianUseCase>(),
        signupPoolOwnerUseCase: sl<SignupPoolOwnerUseCase>(),
        signupCompanyUseCase: sl<SignupCompanyUseCase>(),
      ));

  sl.registerLazySingleton(() => OtpCubit(sl<OtpRepository>()));



  // تسجيل DataSource
sl.registerLazySingleton<UserRemoteDataSource>(
  () => UserRemoteDataSourceImpl(sl<ApiService>()),
);

// تسجيل Repository
sl.registerLazySingleton<UserRepository>(
  () => UserRepositoryImpl(sl<UserRemoteDataSource>()),
);

// تسجيل Cubit
sl.registerLazySingleton(() => UserCubit(sl<UserRepository>()));

// تسجيل UpdateUserCubit

 
  // Notification Feature
  // ----------------------------

  // Remote Data Source
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(sl<ApiService>()),
  );

  // Repository
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl<NotificationRemoteDataSource>()),
  );

  // Cubit
  sl.registerLazySingleton(
    () => NotificationCubit(sl<NotificationRepository>()),
  );
// ----------------------------
// 🛒 Product Feature
// ----------------------------

sl.registerLazySingleton<ProductRemoteDataSource>(
  () => ProductRemoteDataSource(sl<ApiService>()),
);

sl.registerLazySingleton<ProductRepository>(
  () => ProductRepoImpl(sl<ProductRemoteDataSource>()),
);

sl.registerLazySingleton(() => GetAllProductsUsecase(sl<ProductRepository>()));
sl.registerLazySingleton(() => AddProductUsecase(sl<ProductRepository>()));
sl.registerLazySingleton(() => UpdateProductUsecase(sl<ProductRepository>()));
sl.registerLazySingleton(() => DeleteProductUsecase(sl<ProductRepository>()));

sl.registerLazySingleton(
  () => ProductCubit(
    sl<GetAllProductsUsecase>(),
    sl<AddProductUsecase>(),
    sl<UpdateProductUsecase>(),
    sl<DeleteProductUsecase>(),
  ),
);
// ----------------------------
// 📊 Dashboard Feature
// ----------------------------

// Remote Data Source
sl.registerLazySingleton<DashboardRemoteDataSource>(
  () => DashboardRemoteDataSourceImpl(sl<ApiService>()),
);

// Repository
sl.registerLazySingleton<DashboardRepository>(
  () => DashboardRepositoryImpl(sl<DashboardRemoteDataSource>()),
);

// UseCase
sl.registerLazySingleton(
  () => GetAdminStatisticsUseCase(sl<DashboardRepository>()),
);

// Cubit
sl.registerLazySingleton(
  () => DashboardCubit(sl<GetAdminStatisticsUseCase>()),
);
// ----------------------------
// 🏬 Store Statistics Feature
// ----------------------------

// Remote Data Source
sl.registerLazySingleton<StoreStatisticsRemoteDataSource>(
  () => StoreStatisticsRemoteDataSourceImpl(sl<ApiService>()),
);

// Repository
sl.registerLazySingleton<StoreStatisticsRepo>(
  () => StoreStatisticsRepoImpl(sl<StoreStatisticsRemoteDataSource>()),
);

// UseCase
sl.registerLazySingleton(
  () => GetStoreStatisticsUseCase(sl<StoreStatisticsRepo>()),
);

// Cubit
sl.registerLazySingleton(
  () => StoreStatisticsCubit(sl<GetStoreStatisticsUseCase>()),
);

  // 📦 Categories
  // =====================

  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl<CategoryRemoteDataSource>()),
  );

  sl.registerLazySingleton(
    () => GetCategoriesUseCase(sl<CategoryRepository>()),
  );

  sl.registerFactory(
    () => CategoryCubit(sl<GetCategoriesUseCase>()),
  );

sl.registerLazySingleton<ProductSearchRemoteDataSource>(
  () => ProductSearchRemoteDataSource(sl<ApiService>()),
);
sl.registerLazySingleton<ProductSearchRepository>(
  () => ProductSearchRepositoryImpl(sl<ProductSearchRemoteDataSource>()),
);
sl.registerLazySingleton(
  () => SearchProductsUseCase(sl<ProductSearchRepository>()),
);
sl.registerFactory(
  () => ProductSearchCubit(sl<SearchProductsUseCase>()),
);
 // ================= OFFERS (FIXED 💥) =================
  sl.registerLazySingleton<ProductOfferRemoteDataSource>(
    () => ProductOfferRemoteDataSource(api: sl<ApiService>()),
  );

  sl.registerLazySingleton<ProductOfferRepo>(
    () => ProductOfferRepoImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => AddProductOfferUsecase(sl<ProductOfferRepo>()));
  sl.registerLazySingleton(() => UpdateProductOfferUsecase(sl<ProductOfferRepo>()));
  sl.registerLazySingleton(() => DeleteProductOfferUsecase(sl<ProductOfferRepo>()));
  sl.registerLazySingleton(() => GetActiveOffersUseCase(sl<ProductOfferRepo>()));

  sl.registerFactory(
    () => ProductOfferCubit(
      sl<GetActiveOffersUseCase>(),
      addUseCase: sl(),
      updateUseCase: sl(),
      deleteUseCase: sl(),
    ),
  );
// ================= OFFERS FEATURE =================

// Remote DataSource
sl.registerLazySingleton<OfferRemoteDataSource>(
  () => OfferRemoteDataSource(sl<ApiService>()),

);

// Repository
sl.registerLazySingleton<OfferRepository>(
  () => OfferRepoImpl(sl<OfferRemoteDataSource>()),
);

// UseCases
sl.registerLazySingleton(() => GetAllOffersUsecase(sl<OfferRepository>()));
sl.registerLazySingleton(() => AddOfferUsecase(sl<OfferRepository>()));
sl.registerLazySingleton(() => UpdateOfferUsecase(sl<OfferRepository>()));
sl.registerLazySingleton(() => DeleteOfferUsecase(sl<OfferRepository>()));

sl.registerLazySingleton(
  () => OfferCubit(
    sl<GetAllOffersUsecase>(),
    sl<AddOfferUsecase>(),
    sl<UpdateOfferUsecase>(),
    sl<DeleteOfferUsecase>(),
  ),
);

// ----------------------------
// ❓ FAQ Feature
// ----------------------------

sl.registerLazySingleton<FaqRemoteDataSource>(
  () => FaqRemoteDataSource(sl<ApiService>()),
);
sl.registerLazySingleton<FaqRepository>(
  () => FaqRepositoryImpl(sl<FaqRemoteDataSource>()),
);
sl.registerLazySingleton(() => GetAllFaqsUseCase(sl<FaqRepository>()));
sl.registerLazySingleton(() => CreateFaqUseCase(sl<FaqRepository>()));
sl.registerLazySingleton(() => GetFaqUseCase(sl<FaqRepository>()));

sl.registerLazySingleton(() => UpdateFaqUseCase(sl<FaqRepository>()));
sl.registerLazySingleton(() => DeleteFaqUseCase(sl<FaqRepository>()));
sl.registerLazySingleton(() => ToggleFaqVisibilityUseCase(sl<FaqRepository>()));

sl.registerFactory(
  () => FaqCubit(
    getFaqsUseCase: sl<GetAllFaqsUseCase>(),
    createFaqUseCase: sl<CreateFaqUseCase>(),
    getFaqUseCase: sl<GetFaqUseCase>(),
    deleteFaqUseCase: sl<DeleteFaqUseCase>(),
    toggleUseCase: sl<ToggleFaqVisibilityUseCase>(),
    updateFaqUseCase: sl<UpdateFaqUseCase>(),
  ),
);
// ----------------------------
// 📅 BOOKINGS FEATURE
// ----------------------------

// Remote Data Source
sl.registerLazySingleton<BookingRemoteDataSource>(
  () => BookingRemoteDataSource(sl<ApiService>()),
);

// Repository
sl.registerLazySingleton<BookingRepository>(
  () => BookingRepositoryImpl(sl<BookingRemoteDataSource>()),
);

// UseCases
sl.registerLazySingleton(
  () => GetBookingsUseCase(sl<BookingRepository>()),
);

sl.registerLazySingleton(
  () => GetBookingDetailsUseCase(sl<BookingRepository>()),
);

sl.registerLazySingleton(
  () => UpdateBookingUseCase(sl<BookingRepository>()),
);

sl.registerLazySingleton(
  () => DeleteBookingUseCase(sl<BookingRepository>()),
);

// Cubit
sl.registerFactory(
  () => BookingCubit(
    getBookingsUseCase: sl<GetBookingsUseCase>(),
    getDetailsUseCase: sl<GetBookingDetailsUseCase>(),
    updateUseCase: sl<UpdateBookingUseCase>(),
    deleteUseCase: sl<DeleteBookingUseCase>(),
  ),
);

sl.registerLazySingleton<ContactRemoteDataSource>(
  () => ContactRemoteDataSource(sl<ApiService>()),
);
sl.registerLazySingleton<ContactRepository>(
  () => ContactRepoImpl(sl<ContactRemoteDataSource>()),

);
sl.registerLazySingleton(
  () => GetMessagesUseCase(sl<ContactRepository>()),
);

sl.registerLazySingleton(
  () => GetMessageDetailsUseCase(sl<ContactRepository>()),
);

sl.registerLazySingleton(
  () => DeleteMessageUseCase(sl<ContactRepository>()),
);

sl.registerLazySingleton(
  () => UpdateStatusUseCase(sl<ContactRepository>()),
);
sl.registerFactory(
  () => ContactCubit(
    sl<GetMessagesUseCase>(),
    getDetailsUseCase: sl<GetMessageDetailsUseCase>(),
    deleteUseCase: sl<DeleteMessageUseCase>(),
    updateUseCase: sl<UpdateStatusUseCase>(),
  ),
);
// ----------------------------
// ⭐ RATINGS FEATURE
// ----------------------------

// Remote Data Source
sl.registerLazySingleton<RatingsRemoteDataSource>(
  () => RatingsRemoteDataSource(sl<ApiService>()),
);

// Repository
sl.registerLazySingleton<RatingsRepository>(
  () => RatingsRepositoryImpl(sl<RatingsRemoteDataSource>()),
);

// UseCases
sl.registerLazySingleton(
  () => GetRatingsUseCase(sl<RatingsRepository>()),
);

sl.registerLazySingleton(
  () => GetRatingByIdUseCase(sl<RatingsRepository>()),
);

sl.registerLazySingleton(
  () => DeleteRatingUseCase(sl<RatingsRepository>()),
);

sl.registerLazySingleton(
  () => ApproveRatingUseCase(sl<RatingsRepository>()),
);

sl.registerLazySingleton(
  () => RejectRatingUseCase(sl<RatingsRepository>()),
);

// Cubit
sl.registerFactory(
  () => RatingsCubit(
    sl<GetRatingsUseCase>(),
    getRatingByIdUseCase: sl<GetRatingByIdUseCase>(),
    approveUseCase: sl<ApproveRatingUseCase>(),
    rejectUseCase: sl<RejectRatingUseCase>(),
    deleteUseCase: sl<DeleteRatingUseCase>(),
  ),
);


 // 📋 REQUESTS (NEW 💥)
  // =========================
  sl.registerLazySingleton<RequestedServicesRemoteDataSource>(
    () => RequestedServicesRemoteDataSource(sl<ApiService>()),
  );

  sl.registerLazySingleton<RequestedServicesRepository>(
    () => RequestedServicesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => GetRequestsUseCase(sl()));
  sl.registerLazySingleton(() => GetRequestDetailsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteRequestUseCase(sl()));
  sl.registerLazySingleton(() => UpdateRequestStatusUseCase(sl()));

  sl.registerFactory(
    () => RequestsCubit(
      sl(),
      getDetailsUseCase: sl(),
      deleteUseCase: sl(),
      updateStatusUseCase: sl(),
    ),
  );

}

