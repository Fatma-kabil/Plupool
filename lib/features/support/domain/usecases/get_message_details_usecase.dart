
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/support/domain/repos/contact_repo.dart';


class GetMessageDetailsUseCase {
  final ContactRepository repo;

  GetMessageDetailsUseCase(this.repo);

  Future<ContactMessageEntity> call(int id) {
    return repo.getMessageDetails(id);
  }
}