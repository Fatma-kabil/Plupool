import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/technicains/data/models/update_tech_rating_request.dart';
import 'package:plupool/features/technicains/domain/repos/update_tech_rating_repo.dart';

class UpdateTechRatingUseCase {
  final UpdateTechRatingRepo repo;

  UpdateTechRatingUseCase(this.repo);

  Future<Either<Failure, String>> call({
    required int userId,
    required int ratingId,
    required int rating,
  }) {
    return repo.updateTechRating(
      userId: userId,
      ratingId: ratingId,
      request: UpdateTechRatingRequest(
        rating: rating,
      ),
    );
  }
}