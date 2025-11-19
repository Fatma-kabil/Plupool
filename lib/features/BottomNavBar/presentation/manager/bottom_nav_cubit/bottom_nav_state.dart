part of 'bottom_nav_cubit.dart';

abstract class BottomNavState extends Equatable {
  final int currentIndex;
  final StoreFilter filter;

  const BottomNavState(this.currentIndex, this.filter);

  @override
  List<Object> get props => [currentIndex, filter];
}

class NavBarInitial extends BottomNavState {
  NavBarInitial(int currentIndex) : super(currentIndex, StoreFilter.all);
}

class IndexChanged extends BottomNavState {
  IndexChanged(int currentIndex, [StoreFilter filter = StoreFilter.all]) : super(currentIndex, filter);
}
