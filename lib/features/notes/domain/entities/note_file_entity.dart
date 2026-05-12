class NoteFileEntity {
  final int id;
  final int noteId;
  final String fileUrl;
  final String fileType;
  final String originalName;
  final String createdAt;

  NoteFileEntity({
    required this.id,
    required this.noteId,
    required this.fileUrl,
    required this.fileType,
    required this.originalName,
    required this.createdAt,
  });
}