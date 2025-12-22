import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/data/remote_data_sources/notification_remote_data_source.dart';
import 'package:plupool/features/home/domain/entities/notification_entity.dart';
import 'package:plupool/features/home/domain/repos/notification_repo.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  @override
Future<Either<Failure, List<NotificationEntity>>> getNotifications(int userId) async {
  try {
    final models = await remoteDataSource.getNotifications(userId);
    return Right(models);  // لازم تغلفها هنا بـ Right
  } on DioError catch (e) {
    return Left(mapDioError(e)); // غلاف Left مع الخطأ
  } catch (e) {
    return Left(UnknownFailure(e.toString())); // هنا بدل throw Exception ترجع Left
  }
}

}
