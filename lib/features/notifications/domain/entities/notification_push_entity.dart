class NotificationPushEntity {
  final int requested;
  final int sent;
  final int failed;
  final int invalidTokens;
  final bool firebaseConfigured;

  const NotificationPushEntity({
    required this.requested,
    required this.sent,
    required this.failed,
    required this.invalidTokens,
    required this.firebaseConfigured,
  });
}