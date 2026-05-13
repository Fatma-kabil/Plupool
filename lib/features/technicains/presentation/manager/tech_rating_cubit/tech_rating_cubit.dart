import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/technicains/domain/usecases/update_tech_rating_use_case.dart';
import 'tech_rating_state.dart';

class TechRatingCubit extends Cubit<TechRatingState> {
  final UpdateTechRatingUseCase updateTechRatingUseCase;

  TechRatingCubit({required this.updateTechRatingUseCase})
    : super(TechRatingInitial());

  Future<void> updateTechRating({
    required int userId,

    required int rating,
  }) async {
    emit(TechRatingLoading());

    final result = await updateTechRatingUseCase(
      userId: userId,

      rating: rating,
    );

    result.fold(
      (failure) {
        emit(TechRatingError(failure.message));
        print(failure.message);
      },
      (message) {
        emit(TechRatingSuccess(message));
      },
    );
  }
}
