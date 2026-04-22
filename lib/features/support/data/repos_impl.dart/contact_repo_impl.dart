
import 'package:plupool/features/support/data/remote_data_sources/contact_remote_data_source.dart';
import 'package:plupool/features/support/domain/entities/contact_entity.dart';
import 'package:plupool/features/support/domain/repos/contact_repo.dart';

class ContactRepoImpl implements ContactRepository {
  final ContactRemoteDataSource remote;

  ContactRepoImpl(this.remote);

  @override
  Future<List<ContactEntity>> getMessages({
    String? status,
    String? senderRole,
    String? search,
  }) {
    return remote.getMessages(
      status: status,
      senderRole: senderRole,
      search: search,
    );
  }

  @override
  Future<ContactEntity> getMessageDetails(int id) {
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