import 'package:plupool/features/support/domain/repos/contact_repo.dart';

import '../entities/contact_entity.dart';

class GetMessagesUseCase {
  final ContactRepository repo;

  GetMessagesUseCase(this.repo);

  Future<List<ContactEntity>> call({
    String? status,
    String? senderRole,
    String? search,
  }) {
    return repo.getMessages(
      status: status,
      senderRole: senderRole,
      search: search,
    );
  }
}