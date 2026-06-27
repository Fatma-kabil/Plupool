import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';
import 'package:plupool/features/support/domain/repos/contact_repo.dart';


class GetMessagesUseCase {
  final ContactRepository repo;

  GetMessagesUseCase(this.repo);

  Future<ContactMessagesResponse> call({
    String? type,
    String? status,
    String? senderRole,
    String? search,
  }) {
    return repo.getMessages(
      type: type,
      status: status,
      senderRole: senderRole,
      search: search,
    );
  }
}