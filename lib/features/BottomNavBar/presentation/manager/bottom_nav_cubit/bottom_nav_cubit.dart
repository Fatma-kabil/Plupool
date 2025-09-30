import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(NavBarInitial(0));

  void changeCurrentIndex(int index) {
    emit(IndexChanged(index));
  }
}
