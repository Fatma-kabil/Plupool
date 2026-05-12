import '../../domain/entities/note_file_entity.dart';

class NoteFileModel extends NoteFileEntity {
   NoteFileModel({
    required super.id,
    required super.noteId,
    required super.fileUrl,
    required super.fileType,
    required super.originalName,
    required super.createdAt,
  });

  factory NoteFileModel.fromJson(Map<String, dynamic> json) {
    return NoteFileModel(
      id: json['id'],
      noteId: json['note_id'],
      fileUrl: json['file_url'],
      fileType: json['file_type'],
      originalName: json['original_name'],
      createdAt: json['created_at'],
    );
  }
}