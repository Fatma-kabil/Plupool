part of 'bottom_nav_cubit.dart';

sealed class BottomNavState extends Equatable {
  final int index;
  const BottomNavState(this.index);

  @override
  List<Object> get props => [index];
}

final class NavBarInitial extends BottomNavState {
  const NavBarInitial(int index) : super(index);
}

final class IndexChanged extends BottomNavState {
  const IndexChanged(int index) : super(index);
}
