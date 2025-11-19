import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plupool/core/utils/store_filter.dart'; // تأكد من استيراد StoreFilter

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(NavBarInitial(0));

  void changeCurrentIndex(int index, {StoreFilter filter = StoreFilter.all}) {
    emit(IndexChanged(index, filter));
  }
}
