import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/technicains/data/models/update_tech_rating_request.dart';
abstract class UpdateTechRatingRepo {

  Future<Either<Failure, String>>
      updateTechRating({
    required int userId,
  
    required UpdateTechRatingRequest request,
  });

}