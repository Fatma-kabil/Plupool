
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';

class UserNoteFileModel extends UserNoteFileEntity {
  UserNoteFileModel({
    required super.id,
    required super.fileUrl,
    required super.fileType,
    required super.originalName,
    required super.createdAt,
  });

  factory UserNoteFileModel.fromJson(Map<String, dynamic> json) {
    return UserNoteFileModel(
      id: json['id'],
   
      fileUrl: json['file_url'],
      fileType: json['file_type'],
      originalName: json['original_name'],
      createdAt: json['created_at'],
    );
  }
}