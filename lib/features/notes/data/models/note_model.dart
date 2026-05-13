import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/entities/note_entity.dart';
import 'note_file_model.dart';

class NoteModel extends NoteEntity {
   NoteModel({
    required super.id,
    required super.userId,
    required super.note,
    required super.createdAt,
    required super.updatedAt,
    required super.files,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      userId: json['user_id'],
      note: json['note'],
     createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      files: (json['files'] as List)
          .map((e) => NoteFileModel.fromJson(e))
          .toList(),
    );
  }
}


class AddNoteModel {
  final String note;
  final List<File>? files;

  const AddNoteModel({
    required this.note,
    this.files,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    /// note (required)
    formData.fields.add(
      MapEntry('note', note),
    );

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

    return formData;
  }
}

class UpdateNoteModel {
  final String note;
  final List<File>? files;

  const UpdateNoteModel({
    required this.note,
    this.files,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(
      MapEntry('note', note),
    );

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

    return formData;
  }
}

class AddNoteFilesModel {
  final List<File> files;

  const AddNoteFilesModel({
    required this.files,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    for (final file in files) {
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

    return formData;
  }
}