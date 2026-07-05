
class UserNotesEntity {
  final int id;
  final String note;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<UserNoteFileEntity> files;

  UserNotesEntity({
    required this.id,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.files,
  });
}


class UserNoteFileEntity {
  final int id;
  final String fileUrl;
  final String fileType;
  final String originalName;
  final String createdAt;

  UserNoteFileEntity({
    required this.id,
    required this.fileUrl,
    required this.fileType,
    required this.originalName,
    required this.createdAt,
  });
}