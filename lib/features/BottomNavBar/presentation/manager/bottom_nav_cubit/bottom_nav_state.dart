import 'package:equatable/equatable.dart';
import 'package:plupool/core/utils/store_filter.dart';

abstract class BottomNavState extends Equatable {
  final int currentIndex;
  final StoreFilter? filter; // nullable

  const BottomNavState(this.currentIndex, this.filter);

  @override
  List<Object?> get props => [currentIndex, filter];
}

class NavBarInitial extends BottomNavState {
  NavBarInitial(int currentIndex) : super(currentIndex, null); // null = الكل
}

class IndexChanged extends BottomNavState {
  IndexChanged(int currentIndex, [StoreFilter? filter]) : super(currentIndex, filter);
}