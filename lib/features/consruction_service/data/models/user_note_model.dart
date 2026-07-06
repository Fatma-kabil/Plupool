import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_file_model.dart';
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';

class UserNotesModel extends UserNotesEntity {
  UserNotesModel({
    required super.id,
    required super.note,
    required super.createdAt,
    required super.updatedAt,
    required super.files,
  });

  factory UserNotesModel.fromJson(Map<String, dynamic> json) {
    return UserNotesModel(
      id: json['id'],
      note: json['note'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      files: (json['files'] as List)
          .map((e) => UserNoteFileModel.fromJson(e))
          .toList(),
    );
  }
}

class AddNoteModel {
  final String note;
  final List<File>? files;

  const AddNoteModel({required this.note, this.files});

  Future<FormData> toFormData() async {
    final formData = FormData();

    /// note (required)
    formData.fields.add(MapEntry('note', note));

    /// files (optional)
    if (files != null && files!.isNotEmpty) {
      for (final file in files!) {
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }
    }
    print(formData.fields);
    print(formData.files);

    return formData;
  }
}
