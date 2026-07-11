

import 'package:plupool/features/home/domain/entities/add_rating_entity.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';

abstract class AddRatingRepository {
  Future<AddRatingEntity> addRating(
    RatingParams params,
  );
}