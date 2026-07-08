import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/models/confirm_order_request_model.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class ConfirmOrderUseCase {
  final CartRepo repository;

  ConfirmOrderUseCase(this.repository);

  Future<Either<Failure, StoreOrderEntity>> call({
    required ConfirmOrderRequestModel request,
  }) {
    return repository.confirmOrder(request: request);
  }
}