import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/services/domain/params/get_user_booking_params.dart';
import 'package:plupool/features/services/domain/usecases/get_user_booking_usecase.dart';

import 'user_booking_state.dart';

class UserBookingCubit extends Cubit<UserBookingState> {
  final GetUserBookingsUseCase getUserBookingsUseCase;

  UserBookingCubit({
    required this.getUserBookingsUseCase,
  }) : super(UserBookingInitial());

  int? _userId;
  String? _status;
  int _page = 1;
  int _pageSize = 10;

  Future<void> getUserBookings({
    required int userId,
    String? status,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      emit(UserBookingLoading());

      _userId = userId;
      _status = status;
      _page = page;
      _pageSize = pageSize;

      final services = await getUserBookingsUseCase(
        GetUserBookingsParams(
          userId: userId,
          status: status,
          bookingType: 'maintenance_single',
          page: page,
          pageSize: pageSize,
        ),
      );

      final packages = await getUserBookingsUseCase(
        GetUserBookingsParams(
          userId: userId,
          status: status,
          bookingType: 'maintenance_package',
          page: page,
          pageSize: pageSize,
        ),
      );

      emit(
        UserBookingLoaded(
          services: services,
          packages: packages,
        ),
      );
    } catch (e) {
      emit(
        UserBookingError(
          e is Failure ? e.message : 'حدث خطأ غير متوقع',
        ),
      );
      print(e);
    }
  }

 Future<void> refresh() async {
  print('REFRESH CALLED');

  if (_userId == null) {
    print('_userId IS NULL');
    return;
  }

  await getUserBookings(
    userId: _userId!,
    status: _status,
  );
}
}