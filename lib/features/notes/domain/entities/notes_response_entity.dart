import 'note_entity.dart';

class NotesResponseEntity {
  final int userId;
  final int total;
  final List<NoteEntity> notes;

  const NotesResponseEntity({
    required this.userId,
    required this.total,
    required this.notes,
  });
}