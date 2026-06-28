import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/support/data/remote_data_sources/contact_remote_data_source.dart';

import 'package:plupool/features/support/domain/repos/contact_repo.dart';

class ContactRepoImpl implements ContactRepository {
  final ContactRemoteDataSource remote;

  ContactRepoImpl(this.remote);

  @override
  Future<ContactMessagesResponse> getMessages({
    String? type,
    String? status,
    String? senderRole,
    String? search,
    int?userId
  }) {
    return remote.getMessages(
      type: type,
      status: status,
      senderRole: senderRole,
      search: search,
      userId: userId
    );
  }

  @override
  Future<ContactMessageEntity> getMessageDetails(int id) {
    return remote.getMessageDetails(id);
  }

  @override
  Future<void> deleteMessage(int id) {
    return remote.deleteMessage(id);
  }

  @override
  Future<void> updateStatus(int id, String status) {
    return remote.updateStatus(id, status);
  }
}
