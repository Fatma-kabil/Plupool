import 'note_file_entity.dart';

class NoteEntity {
  final int id;
  final int userId;
  final String note;
  final String createdAt;
  final String? updatedAt;
  final List<NoteFileEntity> files;

  NoteEntity({
    required this.id,
    required this.userId,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.files,
  });
}