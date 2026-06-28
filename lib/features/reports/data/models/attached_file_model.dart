import 'package:plupool/features/reports/domain/entities/attached_file_entity.dart';

class AttachedFileModel extends AttachedFileEntity {
  AttachedFileModel({
    required super.id,

    required super.fileUrl,
    required super.fileType,
    required super.originalName,
  });
   factory AttachedFileModel.fromJson(Map<String, dynamic> json) {
    return AttachedFileModel(
      id: json['id'],
     
      fileUrl: json['file_url'],
      fileType: json['file_type'],
      originalName: json['original_filename'],
     
    );
  }
}
