import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/reports/domain/entities/contact_statistcs_entity.dart';

class ContactMessagesResponse {
  final int total;
  final int skip;
  final int limit;

  final ContactStatistics statistics;

  final List<ContactMessageEntity> messages;

  ContactMessagesResponse({
    required this.total,
    required this.skip,
    required this.limit,
    required this.statistics,
    required this.messages,
  });
}