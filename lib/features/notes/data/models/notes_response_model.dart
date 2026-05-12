import '../../domain/entities/notes_response_entity.dart';
import 'note_model.dart';

class NotesResponseModel extends NotesResponseEntity {
  const NotesResponseModel({
    required super.userId,
    required super.total,
    required super.notes,
  });

  factory NotesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotesResponseModel(
      userId: json['user_id'],
      total: json['total'],
      notes: (json['notes'] as List)
          .map((e) => NoteModel.fromJson(e))
          .toList(),
    );
  }
}