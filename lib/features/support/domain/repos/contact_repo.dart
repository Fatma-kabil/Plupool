import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';

abstract class ContactRepository {
  Future<ContactMessagesResponse> getMessages({
    String? type,
    String? status,
    String? senderRole,
    String? search,
    int? userId,
  });
  Future<ContactMessageEntity> getMessageDetails(int id);

  Future<void> deleteMessage(int id);

  Future<void> updateStatus(int id, String status);
}
