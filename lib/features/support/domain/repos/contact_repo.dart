import 'package:plupool/features/support/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<List<ContactEntity>> getMessages({
    String? status,
    String? senderRole,
    String? search,
  });

  Future<ContactEntity> getMessageDetails(int id);

  Future<void> deleteMessage(int id);

  Future<void> updateStatus(int id, String status);
}