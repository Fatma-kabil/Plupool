import 'package:plupool/features/home/data/remote_data_sources/add_rating_remote_data_source.dart';
import 'package:plupool/features/home/domain/entities/add_rating_entity.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';
import 'package:plupool/features/home/domain/repos/add_rating_repo.dart';

class AddRatingRepositoryImpl
    implements AddRatingRepository {
  final AddRatingRemoteDataSource remote;

  AddRatingRepositoryImpl(this.remote);

  @override
  Future<AddRatingEntity> addRating(
    RatingParams params,
  ) {
    return remote.addRating(params);
  }
}