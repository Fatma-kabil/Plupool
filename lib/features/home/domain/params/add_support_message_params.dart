import 'dart:io';

class AddSupportMessageParams {
  final String title;
  final String message;
  final String? type;
  final int? bookingId;
  final List<File>? files;

  const AddSupportMessageParams({
    required this.title,
    required this.message,
    this.type,
    this.bookingId,
    this.files,
  });
}