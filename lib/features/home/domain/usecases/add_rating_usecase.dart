import 'package:plupool/features/home/domain/entities/add_rating_entity.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';
import 'package:plupool/features/home/domain/repos/add_rating_repo.dart';

class AddRatingUseCase {
  final AddRatingRepository repository;

  AddRatingUseCase(this.repository);

  Future<AddRatingEntity> call(
    RatingParams params,
  ) {
    return repository.addRating(params);
  }
}