import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';
import 'package:plupool/features/home/domain/usecases/add_rating_usecase.dart';
import 'package:plupool/features/home/presentaation/manager/add_rating_cubit/add_rating_state.dart';

class AddRatingCubit extends Cubit<RatingState> {
  final AddRatingUseCase addRatingUseCase;

  AddRatingCubit(this.addRatingUseCase) : super(RatingInitial());

  final TextEditingController commentController = TextEditingController();

  int selectedRating = 0;

  void changeRating(int value) {
    selectedRating = value;
    emit(RatingInitial());
  }

  Future<void> addRating() async {
    emit(RatingLoading());

    try {
      final result = await addRatingUseCase(
        RatingParams(
          rating: selectedRating,
          content: commentController.text.trim(),
        ),
      );

      commentController.clear();
      selectedRating = 0;

      emit(RatingSuccess(result));
    } catch (e) {
      debugPrint(e.toString());
      if (e is Failure) {
        emit(RatingError(mapDioError(e.message) as String));
      } else {
        emit(RatingError("حدث خطأ أثناء إرسال التقييم"));
      }
    }
  }

  @override
  Future<void> close() {
    commentController.dispose();
    return super.close();
  }
}
