import 'package:bloc/bloc.dart';

// حالة بسيطة: بس الـ selected index
class DrawerCubit extends Cubit<int> {
  DrawerCubit() : super(0);

  void selectIndex(int index) => emit(index);
}
