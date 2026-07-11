import 'package:dio/dio.dart';
import '../../domain/params/add_support_message_params.dart';

class AddSupportMessageModel extends AddSupportMessageParams {
  const AddSupportMessageModel({
    required super.title,
    required super.message,
    super.type,
    super.bookingId,
    super.files,
  });

  factory AddSupportMessageModel.fromParams(
      AddSupportMessageParams params) {
    return AddSupportMessageModel(
      title: params.title,
      message: params.message,
      type: params.type,
      bookingId: params.bookingId,
      files: params.files,
    );
  }

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(
      MapEntry("title", title),
    );

    formData.fields.add(
      MapEntry("message", message),
    );

    formData.fields.add(
      MapEntry("type", type ?? "support"),
    );

    if (bookingId != null) {
      formData.fields.add(
        MapEntry("booking_id", bookingId.toString()),
      );
    }

    if (files != null && files!.isNotEmpty) {
      for (final file in files!) {
        formData.files.add(
          MapEntry(
            "files",
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split("/").last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}