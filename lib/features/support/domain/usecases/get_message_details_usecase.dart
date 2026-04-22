
import 'package:plupool/features/support/domain/repos/contact_repo.dart';

import '../entities/contact_entity.dart';

class GetMessageDetailsUseCase {
  final ContactRepository repo;

  GetMessageDetailsUseCase(this.repo);

  Future<ContactEntity> call(int id) {
    return repo.getMessageDetails(id);
  }
}