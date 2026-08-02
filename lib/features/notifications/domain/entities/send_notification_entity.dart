class SendNotificationEntity {
  final int recipients;
  final int requested;
  final int sent;
  final int failed;

  const SendNotificationEntity({
    required this.recipients,
    required this.requested,
    required this.sent,
    required this.failed,
  });
}