import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/technicains/data/data_sources/ratings_remote_data_source.dart';
import 'package:plupool/features/technicains/data/models/update_tech_rating_request.dart';
import 'package:plupool/features/technicains/domain/repos/update_tech_rating_repo.dart';

class UpdateTechRatingRepoImpl implements UpdateTechRatingRepo {
  final RatingsTechRemoteDataSource remoteDataSource;

  UpdateTechRatingRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> updateTechRating({
    required int userId,
 
    required UpdateTechRatingRequest request,
  }) async {
    try {
      final result = await remoteDataSource.updateTechRating(
        userId: userId,
     
        request: request,
      );

      return right(result);
    } catch (e) {
      return left(mapDioError(e));
    }
  }
}