import 'package:bloc/bloc.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_state.dart'; // تأكد من استيراد StoreFilter

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(NavBarInitial(0));

  void changeCurrentIndex(int index, {StoreFilter? filter}) {
    emit(IndexChanged(index, filter));
  }
}
